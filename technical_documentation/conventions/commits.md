# Commit Message Conventions for the Project

By adhering to this commit message convention, we ensure that our project history is clear and understandable, making it easier for team members and contributors to track changes and the rationale behind them.

### Format:

Each commit message should adhere to the following structure:

```bash
type-issue_number: description
[optional body]
[optional footer(s)]
```

- type: The type of change being committed.
- issue_number: The identifier of the related issue (if applicable).
- description: A brief summary of the changes made.
- body (optional): Detailed explanation of what was done and why. This section can span multiple lines.
- footer(s) (optional): Additional information, such as breaking changes or related issues.

### Types of Commits:

1. fix
Purpose: To patch a bug in the codebase.
Example: fix-00023: Correct null pointer exception in UserService

2. feature
Purpose: To introduce a new feature to the codebase.
Example: feature-00045: Add user authentication module

3. ci
Purpose: Changes to our CI configuration files and scripts.
Example: ci-00078: Update CircleCI config for parallel testing

4. docs
Purpose: Documentation-only changes.
Example: docs-00112: Add API documentation for UserController

5. style
Purpose: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc.).
Example: style-00134: Reformat code to comply with new style guide

6. refactor
Purpose: A code change that neither fixes a bug nor adds a feature.
Example: refactor-00158: Simplify logic in DataProcessor

7. test
Purpose: Adding missing tests or correcting existing tests.
Example: test-00176: Add unit tests for PaymentService

### Example Commit Messages:

```
fix-00023: Correct null pointer exception in UserService
Body: This fixes a critical bug where a null pointer exception was thrown if the user object was not initialized properly. The issue was resolved by adding a null check before accessing user properties.
Footer: Closes #00023
```

```
feature-00045: Add user authentication module
Body: Implement JWT-based authentication to secure API endpoints. This module includes user login, registration, and token validation.
Footer: See issue #00045 for more details
```

```
ci-00078: Update CircleCI config for parallel testing
Body: Modify the CircleCI configuration to split tests across multiple containers, reducing the overall build time by 30%.
```
