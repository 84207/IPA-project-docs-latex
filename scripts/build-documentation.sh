#!/usr/bin/env bash
# Bash equivalent of scripts/build-documentation.ps1
# Usage: ./scripts/build-documentation.sh
set -euo pipefail

# Colors
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
RED="\033[0;31m"
CYAN="\033[0;36m"
RESET="\033[0m"

echo -e "${GREEN}=== Professional Documentation Build Script ===${RESET}"
echo -e "${YELLOW}Starting documentation generation process...${RESET}"

# Define input files in correct order
inputFiles=(
  "docs/metadata.yaml"
  "docs/01-introduction.md"
  "docs/02-pandoc-fundamentals.md"
  "docs/03-markdown-best-practices.md"
  "docs/04-template-configuration.md"
  "docs/05-automation-workflow.md"
  "docs/06-bibliography.md"
)

# Generate timestamp for output file
timestamp="$(date +%Y%m%d-%H%M)"
outputFile="output/${timestamp}-GUIDE-PROF-DOK-KOMA-SCRIPT.pdf"

echo -e "${CYAN}Input files:${RESET}"
for file in "${inputFiles[@]}"; do
  if [ -f "${file}" ]; then
    echo -e "  ${GREEN}✓ ${file}${RESET}"
  else
    echo -e "  ${RED}✗ ${file} (MISSING!)${RESET}"
    exit 1
  fi
done

echo -e "\n${CYAN}Using KOMA-Script (no custom template needed)...${RESET}"
echo -e "  ${GREEN}✓ KOMA-Script will use Pandoc's default LaTeX template${RESET}"

echo -e "\n${CYAN}Creating output directory...${RESET}"
if [ ! -d "output" ]; then
  mkdir -p output
  echo -e "  ${GREEN}✓ Output directory created${RESET}"
else
  echo -e "  ${GREEN}✓ Output directory exists${RESET}"
fi

echo -e "\n${CYAN}Generating PDF with Pandoc...${RESET}"
echo -e "${YELLOW}Output file: ${outputFile}${RESET}"

# Ensure pandoc exists
if ! command -v pandoc >/dev/null 2>&1; then
  echo -e "${RED}Error: pandoc not found in PATH. Install pandoc and try again.${RESET}" >&2
  exit 2
fi

# Build pandoc command
pandoc_args=(
  "${inputFiles[@]}"
  --pdf-engine=xelatex
  --toc
  --toc-depth=3
  --number-sections
  --citeproc
  -o "${outputFile}"
)

# Run pandoc
if pandoc "${pandoc_args[@]}"; then
  if [ -f "${outputFile}" ]; then
    bytes=$(wc -c < "${outputFile}" | tr -d ' ')
    fileSizeKB=$(awk "BEGIN{printf \"%.2f\", ${bytes}/1024}")
    echo -e "\n${GREEN}=== BUILD SUCCESSFUL ===${RESET}"
    echo -e "${GREEN}PDF generated: ${outputFile}${RESET}"
    echo -e "${GREEN}File size: ${fileSizeKB} KB${RESET}"
    echo -e "\n${YELLOW}Opening PDF...${RESET}"
    # Try to open the PDF cross-platform (Linux, macOS)
    if command -v xdg-open >/dev/null 2>&1; then
      xdg-open "${outputFile}" >/dev/null 2>&1 || true
    elif command -v open >/dev/null 2>&1; then
      open "${outputFile}" >/dev/null 2>&1 || true
    else
      echo -e "${CYAN}No suitable opener found (xdg-open/open). PDF not opened automatically.${RESET}"
    fi
  else
    echo -e "\n${RED}=== BUILD FAILED ===${RESET}"
    echo -e "${RED}PDF file was not generated!${RESET}"
    exit 1
  fi
else
  echo -e "\n${RED}=== BUILD ERROR ===${RESET}"
  echo -e "${RED}Error occurred during PDF generation.${RESET}"
  exit 1
fi

echo -e "\n${GREEN}=== DOCUMENTATION BUILD COMPLETE ===${RESET}\n"
