# Log Analysis Agent

An AI-powered Python application that analyzes log files, detects common issues, extracts meaningful insights, and helps troubleshoot system and application problems.

This project is designed for DevOps engineers, SREs, system administrators, and developers who need quick and intelligent log analysis.

---

## Features

- Parse application and system log files
- Detect errors, warnings, and critical events
- Generate summarized analysis
- Highlight recurring issues
- Identify common failure patterns
- AI-assisted troubleshooting recommendations
- Easy-to-extend Python architecture

---

## Prerequisites

- Python 3.9+
- pip
- Virtual environment (recommended)

---

## Installation

Clone the repository:

```bash
git clone https://github.com/trivedi-rohit/DevOps.git

cd DevOps/Python/log_analysis_agent
```

Create a virtual environment:

```bash
python -m venv venv
```

Activate it:

**Linux / macOS**

```bash
source venv/bin/activate
```

**Windows**

```cmd
venv\Scripts\activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```

---

## Usage

Run the application:

```bash
python main.py
```

Or provide a log file (if supported):

```bash
python main.py --log-file sample.log
```

Example:

```bash
python main.py --log-file logs/application.log
```

---

## Sample Output

```text
==========================
Log Analysis Summary
==========================

Total Lines: 5,231

Errors: 24
Warnings: 58
Critical: 2

Top Issues

• Database connection timeout
• Authentication failures
• Memory allocation warning

Suggested Actions

✓ Verify database availability
✓ Check application credentials
✓ Review system memory usage
```

---

## Use Cases

- Application log analysis
- Production troubleshooting
- Kubernetes pod log inspection
- Server diagnostics
- DevOps automation
- Incident response
- Root cause investigation

---

## Future Improvements

- Support multiple log formats
- AI-powered root cause analysis
- Real-time log monitoring
- Web dashboard
- Docker support
- Kubernetes integration
- Export reports to HTML/PDF
- Email notifications

---

## 🤝 Contributing

Contributions are welcome.

1. Fork the repository
2. Create a feature branch

```bash
git checkout -b feature/new-feature
```

3. Commit your changes

```bash
git commit -m "Add new feature"
```

4. Push the branch

```bash
git push origin feature/new-feature
```

5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License unless stated otherwise.

---

## 👤 Author

**Rohit Trivedi**

GitHub:
https://github.com/trivedi-rohit

---

## ⭐ Support

If you find this project useful, consider giving it a ⭐ on GitHub.