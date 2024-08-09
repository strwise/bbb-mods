# BigBlueButton Limits

Welcome to the **bbb-mods** project! This repository contains a collection of scripts designed to enhance and customize your BigBlueButton server, brought to you by [StreamWise](https://www.streamwise.app). This script allows you to change various limits in the BigBlueButton server.

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/strwise/bbb-mods.git
   ```

2. Navigate to the `bbb-limits` directory:

   ```bash
   cd bbb-limits
   ```

3. Make the script executable:

   ```bash
   chmod +x src/run.sh
   ```

4. Run the script with the desired options:

   ```bash
   ./src/run.sh [options]
   ```

   Available options:

   - `-h, --help`: Show the help message.
   - `--page-limit <limit>`: Set the page limit for uploads.
   - `--max-file-size <size>`: Set the maximum file size for uploads (MB).
   - `--annotation-limit <limit>`: Set the annotation limit for BigBlueButton.

## Example

Here is an example of how to use the script to set the maximum file size for uploads to 50 MB:

```bash
./src/run.sh --max-file-size 50
```

## Contributing

Contributions are welcome! If you have any suggestions, improvements, or bug fixes, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](../LICENSE).

## Contact

For any questions or support, please contact us at [info@streamwise.app](mailto:info@streamwise.app).

Thank you for using **bbb-mods** to enhance your BigBlueButton server!
