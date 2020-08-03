pkgInstaller <- function (libs)
{
  for (lib in libs) {
    if (!is.element(lib, .packages(all.available = TRUE))) {
      utils::install.packages(lib)
    }
    library(lib, character.only = TRUE)
  }
}