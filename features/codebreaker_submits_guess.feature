Feature: code-breaker submits guess
    The code breaker submits a guess of four numbers. The game marks the guess with + and - signs.

    For each number in the guess that match the number and position of a number in the secret code, the mark include on + sign. For each number in the guess that matches the number but not the position of a number in the secret code, the mark includes on - sign.

    Scenario Outline: submit guess
        Given the secret code is "<code>"
        When I guess "<guess>"
        Then the mark should be "<mark>"

        Scenarios: no matches
            | code | guess | mark |
            | 1234 | 5555  |      |

        Scenarios: 1 numbers correct
            | code | guess | mark |
            | 1234 | 1555  | +    |
            | 1234 | 2555  | +    |

        Scenarios: 2 numbers correct
            | code | guess | mark |
            | 1234 | 5254  | ++   |
            | 1234 | 5154  | +-   |
            | 1234 | 5145  | --   |

        Scenarios: 3 numbers correct
            | code | guess | mark |
            | 1234 | 1235  | +++  |
            | 1234 | 1253  | ++-  |
            | 1234 | 3415  | ---  |
