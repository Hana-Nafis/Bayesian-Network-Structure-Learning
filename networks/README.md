# Benchmark network inputs

Place the fitted `bnlearn` network RDS files in the repository root (not this folder), using these exact names:

- `alarm.rds`
- `hailfinder.rds`
- `hepar2.rds`

The data-generation script expects fitted network objects accepted by `bnlearn::rbn()`. The analysis pipeline reads the same files and converts them to network structures with `bnlearn::bn.net()`.

The RDS benchmark files are not bundled in this repository package. Confirm the applicable source and redistribution terms before adding third-party benchmark files to a public repository.
