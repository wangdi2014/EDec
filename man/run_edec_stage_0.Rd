% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/edec_stage_0.R
\name{run_edec_stage_0}
\alias{run_edec_stage_0}
\title{Select informative loci (EDec stage 0)}
\usage{
run_edec_stage_0(reference_meth, reference_classes, max_p_value, num_markers,
  version = "one.vs.rest")
}
\arguments{
\item{reference_meth}{A matrix of reference methylation profiles. Rows
correspond to different loci/probes. Columns correspond to different
reference samples.}

\item{reference_classes}{A vector of numbers or strings representing the classes
  associated with each reference methylation profile in
\code{reference_meth}.}

\item{max_p_value}{The maximum p-value, from T-tests comparing reference
classes, for a locus to be considered as part of the chosen set of marker
loci.}

\item{num_markers}{Number of marker loci to be extracted.}

\item{version}{Either "one.vs.rest" or "each.pair". Specifies whether the marker
selection procedure should compare each reference class against all others,
or if independent comparisons should be made for each pair of reference
classes.}
}
\value{
A vector with the names of the loci/probes selected as markers.
}
\description{
\code{run_edec_stage_0} selects loci/probes that display cell type specific
patterns of methylation, and are likely to be informative for deconvolution.
This selection is based on comparison of reference methylation profiles
representing different cell types.
}
\details{
There are two versions of this method. The user can choose which one to use
by setting the \code{version} argument to either "one.vs.rest" (default) or
"each.pair". In the first version, the method will perform two-sample T-tests
to compare the levels of methylation on each locus/probe between references
of one class against all other references. These comparisons will be done for
each reference class in turn. The method will then select the most hyper- and
hypo-methylated loci/probes that showed p-value less than or equal to
\code{max_p_value}. The same number of markers will be selected from each
comparison, adding up to \code{num_markers}. The difference between the
"one.vs.rest" version and the "each.pair" version of the method is that,
instead of comparing one class of references against all others as is done in
"one.vs.rest" version, the "each.pair" version will perform comparisons
between each pair of reference classes.
}
\examples{
if (requireNamespace("EDecExampleData",quietly=TRUE)) {
  informative_loci <-
    run_edec_stage_0(reference_meth = EDecExampleData::reference_meth,
                     reference_classes = EDecExampleData::reference_meth_class,
                     max_p_value = 1e-5,
                     num_markers = 500,
                     version = "one.vs.rest")
} else {
  print("To run this example, please install EDecExampleData package from
    github by running devtools::install_github('BRL-BCM/EDecExampleData')")
}


}

