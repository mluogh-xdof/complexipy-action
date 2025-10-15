# complexipy GitHub Action

This action calculates the cognitive complexity of Python files in your repository using [complexipy](https://rohaquinlop.github.io/complexipy/), an extremely fast Python library written in Rust.

## What is Cognitive Complexity?

Cognitive Complexity is a measure of how difficult it is to understand a piece of code. Unlike traditional metrics like Cyclomatic Complexity, Cognitive Complexity is designed to better reflect how humans perceive code complexity. It considers factors such as nesting, control flow structures, and recursion to provide a more accurate measure of code maintainability.

## Usage

```yaml
name: Check Code Complexity
on: [push, pull_request]

jobs:
  complexity:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - name: Check Python Code Complexity
      uses: rohaquinlop/complexipy-action@v4
```

## Inputs

| Input                    | Description                                                                                       |
| ------------------------ | ------------------------------------------------------------------------------------------------- |
| `paths`                  | Paths to analyze. Can be local paths or a git repository URL. If not provided, uses pyproject.toml configuration. |
| `exclude`                | Paths to the directories or files to exclude.                                                     |
| `max_complexity_allowed` | Max complexity allowed per function.                                                              |
| `ignore_complexity`      | Ignore complexity threshold and show all functions.                                               |
| `output_csv`             | Generate results in a CSV file.                                                                   |
| `output_json`            | Generate results in a JSON file.                                                                  |
| `details`                | Output detail level (`low` or `normal`).                                                          |
| `quiet`                  | Suppress console output.                                                                          |
| `sort`                   | Sort results by complexity (`asc`, `desc`, or `name`).                                            |

## Examples

### Basic Usage

This will look at the pyproject.toml or complexipy.toml, etc.

```yaml
- uses: rohaquinlop/complexipy-action@v4
```

### Ignore Complexity Threshold

```yaml
- uses: rohaquinlop/complexipy-action@v4
  with:
    paths: './src'
    ignore_complexity: true
```

### Generate CSV Report

```yaml
- uses: rohaquinlop/complexipy-action@v4
  with:
    paths: '.'
    output_csv: true
```

### Generate JSON Report
```yaml
- uses: rohaquinlop/complexipy-action@v4
  with:
    paths: '.'
    output_json: true
```

### Analyze Specific Directory with Low Detail Output

```yaml
- uses: rohaquinlop/complexipy-action@v4
  with:
    paths: './src/python'
    details: 'low'
    sort: 'desc'
```

## Output

The action will:
1. Analyze Python files in the specified paths
2. Calculate cognitive complexity for each function and file
3. Fail if any file exceeds the complexity threshold, unless `ignore_complexity` is set to `true`
4. Optionally generate a CSV or JSON report

### CSV Output Format

When `output_csv: true`, the action generates a `complexipy.csv` file with the following columns:
- Path
- File Name
- Function Name
- Cognitive Complexity

### JSON Output Format

When `output_json: true`, the action generates a `complexipy.json` file.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
