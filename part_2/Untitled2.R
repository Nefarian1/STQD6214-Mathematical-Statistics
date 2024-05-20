#1-a
generate_X <- function(k) {
  # Starting position
  X <- 0
  
  # Simulate k steps
  for (i in 1:k) {
    # Randomly choose left (-1) or right (1) bounce with equal probability
    direction <- sample(c(-1, 1), 1)
    
    # Update the position based on the chosen direction
    X <- X + direction
  }
  
  return(X)
}
set.seed(123)  # 设置随机种子以确保结果可复现
result <- generate_X(10)  # 小球经过10步后的位置
print(result)


#1-b
generate_X_samples <- function(n, k) {
  # Initialize a vector to store the results
  results <- numeric(n)
  
  # Generate n samples of X after k steps
  for (i in 1:n) {
    results[i] <- generate_X(k)
  }
  
  return(results)
}
set.seed(123)  # 设置随机种子以确保结果可复现
samples <- generate_X_samples(5, 10)  # 生成5个样本，每个样本经过10步后的位置
print(samples)


#1-c
# 定义计算均值和方差的函数
calculate_mean_and_variance <- function(samples) {
  mean_value <- mean(samples)
  variance_value <- var(samples)
  return(c(mean_value, variance_value))
}

# 估计 k = 20 时的均值和方差
set.seed(123)  # 设置随机种子以确保结果可复现
samples_k20 <- generate_X_samples(1000, 20)  # 生成1000个样本，每个样本经过20步后的位置
result_k20 <- calculate_mean_and_variance(samples_k20)
print(paste("Mean for k = 20:", result_k20[1]))
print(paste("Variance for k = 20:", result_k20[2]))

# 估计 k = 30 时的均值和方差
set.seed(123)  # 设置随机种子以确保结果可复现
samples_k30 <- generate_X_samples(1000, 30)  # 生成1000个样本，每个样本经过30步后的位置
result_k30 <- calculate_mean_and_variance(samples_k30)
print(paste("Mean for k = 30:", result_k30[1]))
print(paste("Variance for k = 30:", result_k30[2]))


#1-d
#i
generate_X_samples_with_returns <- function(n, k, cost_per_play, reward_threshold, win_amount) {
  # Initialize vectors to store results(初始化向量来存储结果)
  positions <- numeric(n)
  returns <- numeric(n)
  
  # Generate n samples of X after k steps(k步后生成X的n个样本)
  for (i in 1:n) {
    position <- generate_X(k)
    positions[i] <- position
    
    # Calculate return based on the position(根据仓位计算收益)
    if (position >= reward_threshold) {
      returns[i] <- win_amount
    } else {
      returns[i] <- 0
    }
  }
  
  # Deduct the cost of playing the game(扣除玩游戏的费用)
  returns <- returns - cost_per_play
  
  # Return a list containing positions and returns(返回包含仓位和收益的列表)
  return(list(positions = positions, returns = returns))
}

#ii
# 估计游戏利润或亏损，k = 20
set.seed(123)  # 设置随机种子以确保结果可复现
game_results_k20 <- generate_X_samples_with_returns(1000, 20, 10, 8, 100)

# 计算游戏的总利润或亏损
total_profit_loss_k20 <- sum(game_results_k20$returns)
print(paste("Total profit/loss for k = 20:", total_profit_loss_k20))

# 估计游戏利润或亏损，k = 30
set.seed(123)  # 设置随机种子以确保结果可复现
game_results_k30 <- generate_X_samples_with_returns(1000, 30, 10, 8, 100)

# 计算游戏的总利润或亏损
total_profit_loss_k30 <- sum(game_results_k30$returns)
print(paste("Total profit/loss for k = 30:", total_profit_loss_k30))





#2-a
proportion_within_interval <- function(data, k) {
  # Calculate mean and standard deviation of the data
  # 计算数据的平均值和标准差
  x_bar <- mean(data)
  s <- sd(data)
  
  # Define the interval
  # 定义间隔
  lower_limit <- x_bar - k * s
  upper_limit <- x_bar + k * s
  
  # Count the number of data points within the interval
  # 统计区间内数据点的个数
  within_interval <- sum(data >= lower_limit & data <= upper_limit)
  
  # Calculate the proportion within the interval
  # 计算区间内的比例
  proportion <- within_interval / length(data)
  
  return(proportion)
}
# Generate a sample data set
# 生成一个示例数据集
set.seed(123)
sample_data <- rnorm(100, mean = 10, sd = 2)

# Use a function to calculate the proportion of data in the range x̅ ± ks, where k =2
# 使用函数计算在 x̅ ± ks 范围内的数据比例，这里 k = 2
proportion_within_2sd <- proportion_within_interval(sample_data, 2)
print(paste("Proportion within 2 standard deviations:", proportion_within_2sd))


#2-b
# Generate 100 samples from a standard normal distribution of length 10,000
# 生成100个长度为10,000的标准正态分布的样本
set.seed(123)
random_samples <- matrix(rnorm(100 * 10000), nrow = 100)

# Define a function to check the validity of Chebyshev's theorem
# 定义一个函数，用于检查Chebyshev定理的有效性
check_chebyshev <- function(samples, k) {
  proportions <- apply(samples, 1, proportion_within_interval, k = k)
  return(proportions)
}

# Check the validity of Chebyshev's theorem under different values of k
# 检查Chebyshev定理在不同k值下的有效性
k_values <- c(2, 3, 4)  # 选择不同的k值(Choose different k values)
results <- lapply(k_values, function(k) check_chebyshev(random_samples, k))

# 输出结果
for (i in seq_along(k_values)) {
  cat("Proportion within", k_values[i], "standard deviations:", mean(results[[i]]), "\n")
}


#2-c
# Generate 100 uniformly distributed samples of length 10,000
# 生成100个长度为10,000的均匀分布的样本
set.seed(123)
uniform_samples <- matrix(runif(100 * 10000), nrow = 100)

# Check the validity of Chebyshev's theorem for different values of k (using uniform distribution)
# 检查Chebyshev定理在不同k值下的有效性（使用均匀分布）
results_uniform <- lapply(k_values, function(k) check_chebyshev(uniform_samples, k))

# 输出结果(Output results)
for (i in seq_along(k_values)) {
  cat("Proportion within", k_values[i], "standard deviations (Uniform distribution):", mean(results_uniform[[i]]), "\n")
}
