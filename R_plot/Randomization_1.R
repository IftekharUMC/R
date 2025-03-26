score <- c(41.4, 24.1, 36.3, 31.6, 24, 32.3, 31.6, 15.1, 25, 39.8, 58.1, 28, 42.5, 24.2, 43.2)
PAP_AUC <- c(1.72312397, 0.02942837, 0.52254098, 0.32581967, 0.59733607, 1.07581967, 0.76844262, 0.09683402, 1.04303279, 1.01987705, 1.83196721, 1.09528689, 1.59733607, 0.46127049, 1.7602459)
score
PAP_AUC
plot(PAP_AUC, score)
plot(PAP_AUC, score , pch = 16, cex = 1.3, col = "blue", main = "Genomic score ploatted against PAP_AUC", xlab = "PAP_AUC", ylab = "Genomic Score")
lm(PAP_AUC ~ score)
abline(lm(score ~ PAP_AUC))
summary(lm(score ~ PAP_AUC))