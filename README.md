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
      uses: rohaquinlop/complexipy-action@v1
      with:
        paths: '.'  # Analyze the entire repository
        max_complexity: 15  # Set maximum allowed complexity
```

## Inputs

| Input            | Description                                                      | Required | Default                   |
| ---------------- | ---------------------------------------------------------------- | -------- | ------------------------- |
| `paths`          | Paths to analyze. Can be local paths or a git repository URL.    | Yes      | `${{ github.workspace }}` |
| `max_complexity` | Maximum allowed complexity per function. Set to 0 for unlimited. | No       | `15`                      |
| `output`         | Generate results in a CSV file.                                  | No       | `false`                   |
| `details`        | Output detail level (`low` or `normal`).                         | No       | `normal`                  |
| `quiet`          | Suppress console output.                                         | No       | `false`                   |
| `sort`           | Sort results by complexity (`asc`, `desc`, or `name`).           | No       | `asc`                     |

## Examples

### Basic Usage

```yaml
- uses: rohaquinlop/complexipy-action@v1
  with:
    paths: '.'
```

### Custom Maximum Complexity

```yaml
- uses: rohaquinlop/complexipy-action@v1
  with:
    paths: './src'
    max_complexity: 20
```

### Generate CSV Report

```yaml
- uses: rohaquinlop/complexipy-action@v1
  with:
    paths: '.'
    output: true
```

### Analyze Specific Directory with Low Detail Output

```yaml
- uses: rohaquinlop/complexipy-action@v1
  with:
    paths: './src/python'
    details: 'low'
    sort: 'desc'
```

## Output

The action will:
1. Analyze Python files in the specified paths
2. Calculate cognitive complexity for each function and file
3. Fail if any file exceeds the maximum complexity threshold
4. Optionally generate a CSV report

### CSV Output Format

When `output: true`, the action generates a `complexipy.csv` file with the following columns:
- Path
- File Name
- Function Name
- Cognitive Complexity

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.