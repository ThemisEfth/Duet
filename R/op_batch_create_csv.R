#' Process all Dyad Directories to Create CSV Files Using MultimodalR
#'
#' This function processes all dyad directories in the specified input base path,
#' applying the `op_create_csv` function from the MultimodalR package, and saves
#' the output in the corresponding directories in the output base path.
#'
#' @param input_base_path Character. The base path containing dyad directories with JSON files.
#' @param output_base_path Character. The base path where the CSV files will be saved.
#' @param include_filename Logical. Whether to include filenames in the CSV. Default is TRUE.
#' @param include_labels Logical. Whether to include labels in the CSV. Default is FALSE.
#' @param overwrite Logical. Whether to overwrite existing files. Default is FALSE.
#'
#' @return None. The function is called for its side effects.
#' @export
#' @examples
#' \dontrun{
#' input_base_path <- "/path/to/OpenPose_out"
#' output_base_path <- "/path/to/OpenPose_CSV"
#' op_batch_create_csv(input_base_path, output_base_path)
#' }

op_batch_create_csv <- function(input_base_path, output_base_path, include_filename = TRUE, include_labels = FALSE, overwrite = FALSE) {

  # List all dyad directories in the input path
  dyad_dirs <- list.dirs(input_base_path, recursive = FALSE, full.names = TRUE)

  if (length(dyad_dirs) == 0) {
    stop("No dyad directories found in the input base path.")
  }

  # Function to process each dyad directory
  process_dyad <- function(dyad_dir) {
    # Extract dyad name from the path
    dyad_name <- basename(dyad_dir)

    # Define the output path for the current dyad
    output_path <- file.path(output_base_path, dyad_name)

    # Check if the output directory exists and if overwrite is FALSE
    if (dir.exists(output_path) && !overwrite) {
      message(paste("Directory already exists at", output_path, "- Skipping."))
      return(NULL)
    }

    # Ensure the output directory exists
    if (!dir.exists(output_path)) {
      dir.create(output_path, recursive = TRUE)
    }

    # Run the op_create_csv function
    op_create_csv(
      input_path = dyad_dir,
      output_path = output_path,
      include_filename = include_filename,
      include_labels = include_labels
    )
  }

  # Apply the function to each dyad directory
  lapply(dyad_dirs, process_dyad)
}
