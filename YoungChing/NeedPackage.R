packages <- c("rvest","dplyr")
pkgs <- sort(.packages(all.available = TRUE))
install_packages <- packages %in% pkgs
if (any(install_packages == FALSE)){
  install.packages(packages[!install_packages])
}
libpackages = lapply(packages, library, character.only = TRUE)
invisible(libpackages)

require(rvest);require(dplyr)
cat("========================================================","\n")
cat("👍️初始化完成!!","\n")
cat("\n")
