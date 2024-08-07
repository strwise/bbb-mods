# BigBlueButton Page Limit Increase

This project contains a bash script that allows you to increase the page limit for uploads on the BigBlueButton server to a user-defined value.

## Usage

### Option 1

1. Clone the repository:

   ```bash
   git clone https://github.com/strwise/bbb-mods.git
   ```

2. Navigate to the `page-limit-increase` directory:

   ```bash
   cd page-limit-increase
   ```

3. Open the `src/run.sh` file and modify the `PAGE_LIMIT` variable to your desired value. This value represents the maximum number of pages allowed for uploads.

4. Save the changes to the `run.sh` file.

5. Make the script executable:

   ```bash
   chmod +x src/run.sh
   ```

6. Run the script:

   ```bash
   ./src/run.sh
   ```

   The script will update the BigBlueButton server configuration to reflect the new page limit.

7. Verify the changes by accessing the BigBlueButton server and checking the updated page limit for uploads.

### Option 2

Execute the script directly:


```bash

curl https://github.com/strwise/bbb-mods/blob/main/page-limit-increase/src/run.sh | bash

```

## Example

Here's an example of how to use the script:

```bash

curl https://github.com/strwise/bbb-mods/blob/main/page-limit-increase/src/run.sh | bash

Enter the new page limit for uploads: 60

Page limit for uploads has been set to 60

```

Please ensure that you have the necessary permissions and meet the prerequisites before executing the script.

## Contributing

Contributions are welcome! If you have any suggestions, improvements, or bug fixes, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
```