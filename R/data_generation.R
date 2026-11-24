# Generate synthetic observational datasets from the fitted benchmark networks.
# Expected inputs in the project root: alarm.rds, hailfinder.rds, hepar2.rds
# Each RDS file must contain a fitted bnlearn network accepted by bnlearn::rbn().

library(bnlearn)

sample_sizes <- c(500, 1000, 2500, 5000, 10000)
if (!dir.exists("data")) dir.create("data", recursive = TRUE)

networks <- list(
  list(name = "alarm", file = "alarm.rds", seed = 123),
  list(name = "hailfinder", file = "hailfinder.rds", seed = 234),
  list(name = "hepar", file = "hepar2.rds", seed = 345)
)

for (network in networks) {
  if (!file.exists(network$file)) {
    stop(sprintf("Missing benchmark network file: %s", network$file))
  }

  fitted_network <- readRDS(network$file)
  set.seed(network$seed)

  for (n in sample_sizes) {
    simulated_data <- bnlearn::rbn(fitted_network, n = n)
    output_file <- file.path("data", sprintf("%s_%d.csv", network$name, n))
    write.csv(simulated_data, output_file, row.names = FALSE)
    message(sprintf("Wrote %s", output_file))
  }
}
