# Playwright Demo Project

This project demonstrates the use of Robot Framework for end-to-end testing.

## Installation

1.  Clone the repository:

    ```bash
    git clone https://github.com/ediologi/rf-log.git
    cd rf-log
    ```

2.  Create & activate virtual environment

    ```bash
    python3 -m venv venv
    source venv/bin/activate
    ```

3.  Install dependencies:

    ```bash
    pip install -r requirements.txt
    ```

## Configuration

1.  Create a `.env` file in the root directory.
2.  Add the following environment variables:

    ```
    BASE_URL=https://www.secret.com
    USERNAME=standard_user
    PASSWORD=secret_strings
    ```

## Running Tests

Run all tests:

```bash
robot -d output tests/
```

Run specific tests example:

```bash
robot -d output tests/login_tests/LoginPage_test.robot
```

Run specific test case within a file example:

```bash
robot --test "Navigate to Deposit Page" tests/deposit_tests/DepositPage_test.robot
```

## Generating Report

Reports will be generated in the output/ folder:

```bash
output.xml
log.html
report.html
```

## Project Structure

```
├── resources/ # Page Objects and common keywords
├── tests/ # Test files
├── utils/ # Python utilities
├── .env
├── requirements.txt
├── robot.yaml # Project configuration
└── README.md
```
