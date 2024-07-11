# BigBlueButton Page Limit Increase

This project contains a bash script that allows you to increase the page limit for uploads on the BigBlueButton server to a user-defined value.

## Usage

1. Clone the repository:

   ```bash
   git clone <repository_url>
   ```

2. Navigate to the `bigbluebutton-page-limit-increase` directory:

   ```bash
   cd bigbluebutton-page-limit-increase
   ```

3. Open the `src/increase_upload_limit.sh` file and modify the `PAGE_LIMIT` variable to your desired value. This value represents the maximum number of pages allowed for uploads.

4. Save the changes to the `increase_upload_limit.sh` file.

5. Make the script executable:

   ```bash
   chmod +x src/increase_upload_limit.sh
   ```

6. Run the script:

   ```bash
   ./src/increase_upload_limit.sh
   ```

   The script will update the BigBlueButton server configuration to reflect the new page limit.

7. Verify the changes by accessing the BigBlueButton server and checking the updated page limit for uploads.

## Contributing

Contributions are welcome! If you have any suggestions, improvements, or bug fixes, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
```

Please note that the actual implementation of the `increase_upload_limit.sh` script is not provided in the project tree structure. You would need to write the script logic yourself based on the requirements mentioned.