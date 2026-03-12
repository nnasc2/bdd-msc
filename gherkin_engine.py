import sys
from behave.parser import Parser

def parse_gherkin(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    parser = Parser()
    feature = parser.parse(content)

    print(f"Feature: {feature.name}")

    for scenario in feature.scenarios:
        print(f"\n  Scenario: {scenario.name}")
        for step in scenario.steps:
            print(f"    {step.keyword} {step.name}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
                sys.exit(1)

    parse_gherkin(sys.argv[1])