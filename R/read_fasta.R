#' Read a FASTA file into a DNAbin object.
#'
#' @param fasta_file The path to the FASTA file
#' @param ... Additional arguments to pass to `ape::read.FASTA`
#'
#' @return DNAbin containing the sequences.
#'
#' @examples
#'
#' path <- system.file("testdata", "demo-sequences.fasta",
#'                     package = "timtamslamR")
#' seqs <- read_fasta(path)
#'
#' @export
read_fasta <- function(fasta_file, ...) {
  ape::read.FASTA(fasta_file, ...)
}
