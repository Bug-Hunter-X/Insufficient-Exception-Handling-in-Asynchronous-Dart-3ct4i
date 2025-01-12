# Insufficient Exception Handling in Asynchronous Dart

This repository demonstrates a common error in asynchronous Dart code: inadequate exception handling. The provided `bug.dart` file shows a function that fetches data asynchronously but only prints the exception without providing specific handling for different types of errors.  The `bugSolution.dart` shows how to improve this with more robust error handling.

## Bug
The `fetchData` function in `bug.dart` lacks detailed error handling. A simple `print` statement is insufficient for production-ready applications.  Different error types should trigger different actions (e.g., retry, show an error message to the user, fallback to default data).

## Solution
The `bugSolution.dart` file demonstrates improved error handling.  It checks the `response.statusCode` for specific HTTP error codes and provides a more informative message to the user (or logs to help with debugging).  It also includes handling for potential `FormatException` during JSON decoding.  This improved example showcases a more robust and informative approach to exception management, crucial for application reliability.