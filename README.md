# Kayden
Kayden is a Linux CLI-based email client designed to send emails seamlessly through the terminal. Utilizing the Postfix SMTP service, Kayden allows users to quickly compose and send emails with optional attachments and scheduling features.
#### Features

- **Simple Interaction**: User-friendly prompts guide you through entering the necessary email details.
- **Attachment Support**: Easily attach files to your emails by specifying the file path.
- **Scheduling**: Schedule emails to be sent at a later time using various time formats , you can also save mails as draft and send/schedule them later.
- **CC and BCC**: Include CC and BCC recipients for your emails.
- **Logging**: Keep track of sent emails with log files.

#### Requirements

- **Postfix**: Ensure Postfix SMTP service is installed and configured on your system.
- **sendEmail**: A lightweight, command line SMTP email client.
- **at**: A command-line utility for scheduling jobs to be executed at a later time.

### Installation

1. **Postfix**: 
   Install Postfix by running:
   ```sh
   sudo apt-get install postfix
   ```

2. **sendEmail**: 
   Install the sendEmail package:
   ```sh
   sudo apt-get install sendemail
   ```

3. **at**: 
   Install the at package:
   ```sh
   sudo apt-get install at
   ```

4. **Kayden**:
   Download `kayden.sh` and make it executable:
   ```sh
   chmod +x /path/to/kayden.sh
   ```

### Usage

To use Kayden, simply run the script:
```sh
./kayden.sh
```

Follow the prompts to enter:
- Sender's email address
- Receiver's email address
- CC email address (optional)
- BCC email address (optional)
- Subject of the email
- Body content of the email
- File path of the attachment (optional)

You will then be asked if you want to schedule the email. If yes, provide the desired time using one of the supported formats.

### Example

```sh
./kayden.sh
```

```
Welcome to this command line based mail server. You can send mail to your desired location via command line with ease. Just answer the following questions and you can leave blank spaces if you don't want to include anything.

Insert sender's mail address: sender@example.com
Insert receiver's mail address: receiver@example.com
Insert cc mail address: cc@example.com
Insert bcc mail address: bcc@example.com
Write the subject of your message: Meeting Reminder
Write content-body of your message: Don't forget our meeting tomorrow at 10 AM.
Attest the path of attachment you wanna mail. {example format "/path/to/test.cpp"} /path/to/document.pdf

Your attachment is = document.pdf 

Do you want to schedule this mail? [y/n]: y
Scheduling your mail

When would you like to schedule this mail? 
Current system date is Mon Jan 01 00:00:00 UTC 2024 
Specify the runtime: tomorrow at 09:00
```

### License

This project is licensed under the MIT License. See the LICENSE file for more details.

### Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

### Contact

For any inquiries or issues, please contact [welshdragon779@gmail.com].

---

This README file provides an overview and usage instructions for Kayden, making it easy for users to get started and understand the functionalities of the CLI-based emailer.
