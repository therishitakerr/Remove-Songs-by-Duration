
# Remove Songs by Duration

This Bash script is designed to process audio files by their duration. It moves files shorter than a specified duration (default: 2 minutes) to a designated directory named `toberemoved`.

## Overview

The script recursively traverses directories from the current working directory, checks the duration of audio files, and moves those with durations shorter than the specified threshold into the `toberemoved` directory.

## Features

- **Recursive Processing**: Processes all audio and video files in the current directory and its subdirectories.
- **Duration Filtering**: Moves files with durations shorter than the specified threshold to a separate folder.
- **Automatic Folder Creation**: Creates a `toberemoved` folder if it doesn't already exist.
- **Supports Audio and Video Files**: Designed for file types supported by `mediainfo`.

## Requirements

- **Bash**: The script is written in Bash.
- **mediainfo**: A command-line tool for retrieving media file information. Install it using your package manager:
  - **Ubuntu/Debian**: `sudo apt-get install mediainfo`
  - **MacOS**: `brew install mediainfo`

## Usage

1. **Save the Script**: Save the script as `LessThanTwoMinutes.sh` or any name you prefer.

2. **Make the Script Executable**:
   ```bash
   chmod +x LessThanTwoMinutes.sh
   ```

3. **Run the Script**:
   ```bash
   ./LessThanTwoMinutes.sh
   ```

   The script will start processing from the current directory. Files shorter than the default duration (2 minutes) will be moved to the `toberemoved` folder.

## Customizing Duration

The script is set to move files shorter than 2 minutes by default. You can modify the `flag` variable in the script to adjust the duration threshold according to your needs.

## Example

Here's an example of how the script works:

1. **Initial Directory Structure**:
   ```
   /path/to/files/
   ├── song1.mp3
   ├── song2.wav
   └── subdirectory/
       └── song3.mp3
   ```

2. **After Running the Script**:
   ```
   /path/to/files/
   ├── song2.wav
   └── subdirectory/
       └── song3.mp3
   └── toberemoved/
       ├── song1.mp3
   ```

   Files with durations shorter than 2 minutes will be moved to the `toberemoved` directory.

## Notes

- The script is designed for audio files but will also work for video files, moving those with durations shorter than the specified threshold.
- Ensure that `mediainfo` is properly installed and accessible in your PATH.

## Contributing

Feel free to contribute to this script by opening an issue or submitting a pull request with improvements or fixes.
