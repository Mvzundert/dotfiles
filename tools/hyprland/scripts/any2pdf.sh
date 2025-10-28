#!/bin/bash
#
# any2pdf - convert ~any to pdf
#
# Pieter Krul <pkrul@auxio.org>

# Default password for output PDF can be set using the environment
# variable "PDFPASSWORD"
#
PDFPASSWORD=""

##############################################################################
#
# Image density/resolution (DPI)
#
#          default | screen | ebook  | printer,
#                  |        |        | prepress
#         +--------+--------+--------+--------+
# color   |   72   |   72   |   150  |   300  |
#          --------+--------+--------+--------
#  gray   |   72   |   72   |   150  |   300  |
#         +--------+--------+--------+--------+
#  mono   |  300   |  300   |   300  |  1200  |
#         +--------+--------+--------+--------+
# custom  |   96   |   96   |   600  |  2400  |
#         +--------+--------+--------+--------+
DENSITY=ebook
RESOLUTION=150

# Resolution for pattern fills and fonts converted to bitmaps.
RESOLUTION_BITMAP=1200

# Embed fonts (bool)
EMBED_FONTS=true
EMBED_SUBSETFONTS=false

# Use auto-downsampling on high resolution color, grayscale,
# and/or monochomatic imagery, honours RESOLUTION.
DOWNSAMPLE_COLOR=true
DOWNSAMPLE_GRAY=false
DOWNSAMPLE_MONO=false

# Image compression level (percentage of image to keep)
# Recommendation: ~92-100 for JPEG
# Default: 94     ~85-100 for other image algorithms
QUALITY=94

# Rotating pages
#           None:
#            All:
#     PageByPage:
#
AUTOROTATE="None"

# Paper standards. PAPERSIZE is actually used to
PAPERNAME=a4

#
# Paper standards. PAPERSIZE is actually used to
PAPERNAME=a4
PAPERSIZE=2970x2100

# Levels of verbosity: 0-3
VERBOSE=${VERBOSE:-0}

##############################################################################
shopt -s extglob

ARGS="${@}"

((${#ARGS}))

if [[ ${#ARGS} -eq 0 ]]; then
    echo "Usage: $0 [image] <images>"
    exit 1
elif ! hash gs >/dev/null 2>&1; then
    echo "Please install Ghostscript first."
    exit 2
elif ! hash convert >/dev/null 2>&1; then
    echo "Please install (Image|Graphics)Magick first."
    exit 3
fi

MKTMPDIR="${TMPDIR:-/var/tmp}"

ctime=$(date '+%Y%m%d%H%M%S')
tmpfile=$(mktemp --tmpdir="${MKTMPDIR}" --suffix='.pdf' -t any2pdf-XXXXXXXXXX)

infile="${1}"
if [[ ! -r "${infile}" ]]; then
    echo "Error, cannot open file '${infile}'."
    echo "Usage: $0 [image] <images>"
    exit 4
fi

# Create the document title from the first file name, or PDFTITLE environment
# variable, and use everything before the first period (.)

if [[ -z "${PDFTITLE}" ]]; then
    title="${infile}"
    title="${title/.*/}"
else
    title="${PDFTITLE}"
fi

outfile="any2pdf-${ctime}-${title//+([^A-Za-z0-9])/_}.pdf"
outsize=0

keywords="${title[@]//+([^A-Za-z0-9])/,}"

if [[ -x exiftool ]]; then
    author=$(exiftool -S -Artist -Copyright "${infile}" | cut -f2-4 -d' ')
fi
author="${author:-${LOGNAME}}"
creator='AUXIO any2pdf 1.0 \(pkrul@auxio.org\)'
subject="${title} converted to PDF format"
producer_im="$(convert -version | head -1 | cut -f2-4 -d' ')"
producer_gs="$(gs -h | head -1 | sed -e 's/(/\\\(/g' -e 's/)/\\\)/g')"

cat <<__EOF__ >"${tmpfile}marks"
[
  /Title        (${title})
  /Author       (${author})
  /Subject      (${subject})
  /Keywords     (${keywords})
  /CreationDate (D:${ctime})
  /ModDate      (D:${ctime})
  /Creator      (${creator})
  /Producer     (${producer_im} + ${producer_gs})
  /DOCINFO pdfmark
__EOF__

if [[ ${VERBOSE} -eq 0 ]]; then
    IM_VERBOSE=''
    GS_VERBOSE='-q'
else
    IM_VERBOSE='-monitor'
    GS_VERBOSE=''
fi
#    -filter Lanczos \
#    -sampling-factor "1x1" \
#    -unsharp "1.5x1+0.7+0.02" \
if [[ -n "${PDFPASSWORD}" ]]; then
    PDFPASS="-sPDFPassword=${PDFPASSWORD}"
fi

convert ${IM_VERBOSE} \
    -monitor \
    "$@" \
    -bordercolor "LightGray" \
    -border 5 \
    -density "${RESOLUTION}" \
    -quality "${QUALITY}" \
    -resize "${PAPERSIZE}" \
    "${tmpfile}" &&
    gs \
        "${GS_VERBOSE}" \
        -dAutoRotatePages="/${AUTOROTATE}" \
        -dBATCH \
        -dCompatibilityLevel=1.4 \
        -dConvertCMYKImagesToRGB=true \
        -dCompressFonts=true \
        -dColorImageResolution="${RESOLUTION}" \
        -dDownsampleColorImages="${DOWNSAMPLE_COLOR}" \
        -dDownsampleGrayImages="${DOWNSAMPLE_GRAY}" \
        -dDownsampleMonoImages="${DOWNSAMPLE_MONO}" \
        -dDetectDuplicateImages=true \
        -dEmbedAllFonts="${EMBED_FONTS}" \
        -dFIXEDMEDIA \
        -dGrayImageResolution="${RESOLUTION}" \
        -dMonoImageResolution="${RESOLUTION}" \
        -dNOPAUSE \
        -dPDFFitPage \
        -dPDFSETTINGS=/${DENSITY} \
        -r"${RESOLUTION_BITMAP}" \
        -sDEVICE=pdfwrite \
        -sPAPERSIZE="${PAPERNAME}" \
        ${PDFPASS} \
        -sOutputFile="${outfile}" \
        "${tmpfile}" \
        "${tmpfile}marks" &&
    outstat="$(stat --format='%s' ${outfile} 2>&1)" &&
    outsize=$((outstat / 1024)) &&
    echo "PDF document '${outfile}' (${outsize} kB) ready." ||
    (
        echo "Error occured, failed writing PDF document '${outfile}'."
        exit 5
    )

rm -f "${tmpfile}" "${tmpfile}marks" >/dev/null 2>&1

exit 0

# END
