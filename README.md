andrekutianski: @workspace  write a compelling main README for this project

Workspace: ```markdown
# bbb-mods

Welcome to the **bbb-mods** project! This repository contains a collection of scripts designed to enhance and customize your BigBlueButton server bring to you by [StreamWise](https://www.streamwise.app). Whether you need to increase the page limit for uploads or change the default PDF presentation, our scripts make it easy to apply these modifications.

## Projects

### [Page Limit Increase](page-limit-increase/README.md)

This script allows you to increase the page limit for uploads on your BigBlueButton server. You can set a user-defined value to ensure your server meets your specific needs.

#### Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/strwise/bbb-mods.git
   ```

2. Navigate to the `page-limit-increase` directory:

   ```bash
   cd page-limit-increase
   ```

3. Make the script executable:

   ```bash
   chmod +x src/run.sh
   ```

4. Run the script:

   ```bash
   ./src/run.sh
   ```

For more detailed instructions, refer to the [Page Limit Increase README](page-limit-increase/README.md).

### [Presenter Change](presenter-change/README.md)

This script allows you to change the default PDF document used by your BigBlueButton server. You can specify a local file path or a remote link to the new PDF document.

#### Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/strwise/bbb-mods.git
   ```

2. Navigate to the `presenter-change` directory:

   ```bash
   cd presenter-change
   ```

3. Make the script executable:

   ```bash
   chmod +x src/run.sh
   ```

4. Run the script:

   ```bash
   ./src/run.sh
   ```

For more detailed instructions, refer to the [Presenter Change README](presenter-change/README.md).

## Contributing

Contributions are welcome! If you have any suggestions, improvements, or bug fixes, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

For any questions or support, please contact us at [info@streamwise.app](mailto:info@streamwise.app).

Thank you for using **bbb-mods** to enhance your BigBlueButton server!
```