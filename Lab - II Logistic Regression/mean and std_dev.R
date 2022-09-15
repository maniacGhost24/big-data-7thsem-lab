v <- c(1:100)
print(v)

print(mean(v))

s <- sqrt(sum((v-mean(v))^2/(length(v)-1)))
print(s)