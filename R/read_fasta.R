#' Read a FASTA file into a DNAbin object.
#'
#' @param fasta_file The path to the FASTA file
#' @param ... Additional arguments to pass to `ape::read.FASTA`
#'
#' @export
read_fasta <- function(fasta_file, ...) {
  ape::read.FASTA(fasta_file, ...)
}
