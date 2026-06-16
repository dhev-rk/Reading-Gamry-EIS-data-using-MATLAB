A robust MATLAB utility designed to batch convert Stata data files (.dta) into Excel spreadsheets (.xlsx). This tool seamlessly handles individual file conversions as well as processing entire directories of files in a single run.
Features

    Single & Batch Processing: Convert a single .dta file or scan an entire folder to batch-convert all files.

    Automated Output: Automatically saves the converted .xlsx files in the same directory (or a designated output folder) with matching filenames.

    No Stata Required: Relies entirely on MATLAB's native data handling and file I/O capabilities.

Prerequisites

    MATLAB (R2019b or newer recommended for optimal table export support).

    No additional external toolboxes are strictly required, as it utilizes MATLAB's built-in readtable and writetable functions.

How It Works Under the Hood

The conversion pipeline follows a straightforward three-step process to ensure data integrity:

[ .dta File ]  ──>  ( MATLAB Table )  ──>  [ .xlsx File ]

    Scan & Detect: The script filters the target directory for any files matching the *.dta extension.

    Ingest: It reads the Stata binary format into a memory-efficient MATLAB table object, preserving variable names.

    Export: It writes the table structure directly to an Excel sheet using writetable.

Contributing

Contributions to improve performance, add support for specific Stata variable labels, or optimize memory management for massive datasets are welcome!
