# Humanforce Assessment - Todo App Test Automation by Hannah Chua

This project contains UI test automation for a Humanforce Assessment - Todo mobile application using **Robot Framework** and **Appium** by **Hannah Chua**.

---

## Tech Stack

- [Robot Framework](https://robotframework.org/)
- [Appium](https://appium.io/)
- Python 3.11+
- Android Emulator or real device (Appium-compatible)

---

## 🔧 Installation Guide

### 1. Clone the project

```bash
git clone https://github.com/chua-hannah/automation-test_chua-hannah.git
cd automation-test_chua-hannah
```

### 2. Install Python dependencies

Make sure Python 3.11+ and `pip` are installed, then run:

```bash
pip install -r requirements.txt
```

---

## `requirements.txt`

Create a file named `requirements.txt` with the following contents:

```
robotframework
robotframework-appiumlibrary
Appium-Python-Client
```

---

## Appium Setup

### 1. Install Appium globally

```bash
npm install -g appium
```

### 2. Start Appium server

```bash
appium
```

> Or use the Appium Desktop App if preferred.

---

## Device Setup

Ensure you have an emulator or a real Android device connected:

```bash
adb devices
```

---

## Running the Tests

Simply run:

```bash
robot -d report UI/tests
```

Reports will be generated inside the `report/` folder:

- `report.html` – Overview
- `log.html` – Detailed log
- `output.xml` – Raw test data

---

## Best Practices Followed

- Gherkin-style test cases
- Page Object Model (POM) via `resources/page_objects`
- Custom test data and utilities
- Clear separation of concerns
- Easy local execution

---

## Contact

For questions or collaboration, feel free to open an issue or reach out at [hannahchua013@gmail.com].
