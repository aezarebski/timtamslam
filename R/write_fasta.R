#' Write a DNAbin object to a FASTA file.
#'
#' @param seqs A DNAbin object
#' @param fasta_file The path to the FASTA file
#' @param ... Additional arguments to pass to `ape::write.FASTA`
#'
#' @export
write_fasta <- function(seqs, fasta_file, ...) {
  ape::write.FASTA(seqs, fasta_file, ...)
}
