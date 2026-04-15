#!/usr/bin/env bash
set -euo pipefail

REPO_SLUG="${LIN_DOS_REPO:-bmja62/lin-dos}"
BRANCH="${LIN_DOS_BRANCH:-main}"
INSTALL_DIR="${LIN_DOS_HOME:-$HOME/.local/share/lin-dos}"
ARCHIVE_URL="https://github.com/${REPO_SLUG}/archive/refs/heads/${BRANCH}.tar.gz"
TMP_DIR="$(mktemp -d)"

cleanup() {
    rm -rf "${TMP_DIR}"
}
trap cleanup EXIT

echo "Downloading LIN-DOS from ${ARCHIVE_URL}"
curl -fsSL "${ARCHIVE_URL}" | tar -xz -C "${TMP_DIR}"

SRC_DIR="${TMP_DIR}/$(basename "${REPO_SLUG}")-${BRANCH}"
if [[ ! -d "${SRC_DIR}" ]]; then
    echo "Failed to locate extracted LIN-DOS source."
    exit 1
fi

mkdir -p "${INSTALL_DIR}"
for dir in cd cls copy date md rd time tree type ver; do
    rm -rf "${INSTALL_DIR}/${dir}"
    cp -R "${SRC_DIR}/${dir}" "${INSTALL_DIR}/${dir}"
done

for file in README.MD LICENSE command.com; do
    cp "${SRC_DIR}/${file}" "${INSTALL_DIR}/${file}"
done

BASHRC_FILE="${HOME}/.bashrc"
SOURCE_LINE="source \"${INSTALL_DIR}/command.com\""
if [[ -f "${BASHRC_FILE}" ]] && grep -Fq "${SOURCE_LINE}" "${BASHRC_FILE}"; then
    echo "LIN-DOS is already configured in ${BASHRC_FILE}"
else
    echo "" >> "${BASHRC_FILE}"
    echo "# LIN-DOS loader" >> "${BASHRC_FILE}"
    echo "${SOURCE_LINE}" >> "${BASHRC_FILE}"
    echo "Added LIN-DOS loader to ${BASHRC_FILE}"
fi

echo "LIN-DOS installed at ${INSTALL_DIR}"
echo "Run: source \"${BASHRC_FILE}\""
