# Plot weight by group and color by group
library("ggpubr")
my_data <- read.csv("PI.csv")
ggboxplot(my_data, x = "Phenotype", y = "PS2", 
          color = "Phenotype", palette = c( "#0066FF", "#FF33FF","#0066FF", "#FF33FF", "#0066FF", "#FF33FF","#0066FF", "#FF33FF", "#0066FF", "#FF33FF","#0066FF", "#FF33FF","#0066FF", "#FF33FF"), ylab = "PS2", xlab = "Phenotype", add = "jitter") + geom_signif(na.rm = FALSE, comparisons = list(c("Pt.5_R", "Pt.5_S"), c("Pt1_R", "Pt1_S"), c("Pt.4_R", "Pt.4_S"), c("Pt.3_R", "Pt.3_S"), c("Pt.2_R", "Pt.2_S"), c("Pt.1_R", "Pt.1_S"), c("Pt.05_R", "Pt.05_S") ), test = t.test, test.args = list(paired = FALSE), annotations = NULL, map_signif_level = c(), y_position = NULL, xmin = NULL, xmax = NULL, margin_top = 0.05, step_increase = 0.12, tip_length = 0.03, manual = FALSE)+ggtitle("Genome-Wide Polygenic Score (GPS)")
