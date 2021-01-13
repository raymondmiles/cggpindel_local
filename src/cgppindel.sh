#!/bin/bash
# cgppindel 1.0.0
# Generated by dx-app-wizard.
#
# Basic execution pattern: Your app will run on a single machine from
# beginning to end.
#
# Your job's input variables (if any) will be loaded as environment
# variables before this script runs.  Any array inputs will be loaded
# as bash arrays.
#
# Any code outside of main() (or any entry point you may add) is
# ALWAYS executed, followed by running the entry point itself.
#
# See https://documentation.dnanexus.com/developer for tutorials on how
# to modify this file.

main() {

    echo "Value of reference: '$reference'"
    echo "Value of simrep: '$simrep'"
    echo "Value of genes: '$genes'"
    echo "Value of unmatched: '$unmatched'"
    echo "Value of assembly: '$assembly'"
    echo "Value of species: '$species'"
    echo "Value of seqtype: '$seqtype'"
    echo "Value of filter: '$filter'"
    echo "Value of tumour: '$tumour'"
    echo "Value of normal: '$normal'"
    echo "Value of outdir: '$outdir'"

    # The following line(s) use the dx command-line tool to download your file
    # inputs to the local file system using variable names for the filenames. To
    # recover the original filenames, you can use the output of "dx describe
    # "$variable" --name".

    dx download "$reference" -o reference

    dx download "$simrep" -o simrep

    dx download "$genes" -o genes

    dx download "$unmatched" -o unmatched

    dx download "$filter" -o filter

    dx download "$tumour" -o tumour

    dx download "$normal" -o normal

    # Fill in your application code here.
    #
    # To report any recognized errors in the correct format in
    # $HOME/job_error.json and exit this script, you can use the
    # dx-jobutil-report-error utility as follows:
    #
    #   dx-jobutil-report-error "My error message"
    #
    # Note however that this entire bash script is executed with -e
    # when running in the cloud, so any line which returns a nonzero
    # exit code will prematurely exit the script; if no error was
    # reported in the job_error.json file, then the failure reason
    # will be AppInternalError with a generic error message.

    # The following line(s) use the dx command-line tool to upload your file
    # outputs after you have created them on the local file system.  It assumes
    # that you have used the output field name for the filename for each output,
    # but you can change that behavior to suit your needs.  Run "dx upload -h"
    # to see more options to set metadata.

    output_vcf=$(dx upload output_vcf --brief)
    vcf_index=$(dx upload vcf_index --brief)
    wt_bam=$(dx upload wt_bam --brief)
    wt_bai=$(dx upload wt_bai --brief)
    wt_bam_md5=$(dx upload wt_bam_md5 --brief)
    mt_bam=$(dx upload mt_bam --brief)
    mt_bai=$(dx upload mt_bai --brief)
    mt_bam_md5=$(dx upload mt_bam_md5 --brief)
    out_bed=$(dx upload out_bed --brief)

    # The following line(s) use the utility dx-jobutil-add-output to format and
    # add output variables to your job's output as appropriate for the output
    # class.  Run "dx-jobutil-add-output -h" for more information on what it
    # does.

    dx-jobutil-add-output output_vcf "$output_vcf" --class=file
    dx-jobutil-add-output vcf_index "$vcf_index" --class=file
    dx-jobutil-add-output wt_bam "$wt_bam" --class=file
    dx-jobutil-add-output wt_bai "$wt_bai" --class=file
    dx-jobutil-add-output wt_bam_md5 "$wt_bam_md5" --class=file
    dx-jobutil-add-output mt_bam "$mt_bam" --class=file
    dx-jobutil-add-output mt_bai "$mt_bai" --class=file
    dx-jobutil-add-output mt_bam_md5 "$mt_bam_md5" --class=file
    dx-jobutil-add-output out_bed "$out_bed" --class=file
}
