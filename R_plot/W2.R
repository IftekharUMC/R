# Plot weight by group and color by group
library("ggpubr")
my_data <- read.csv("PI.csv")
ggboxplot(my_data, x = "Phenotype", y = "Weight_02", 
          color = "Phenotype", palette = c("#00AFBB", "#E7B800", "#B2182B","#D6604D", "#66F533", "#000000", "#FFCC00", "#FF6600", "#4393C3", "#2166AC", "#FF33FF", "#993333", "#CC9966", "#0066FF"),
          ylab = "Weight_02", xlab = "Phenotype", add = "jitter")+geom_signif(na.rm = FALSE, comparisons = list(c("Pt.5_R", "Pt.5_S"), c("Pt1_R", "Pt1_S"), c("Pt.4_R", "Pt.4_S"), c("Pt.3_R", "Pt.3_S"), c("Pt.2_R", "Pt.2_S"), c("Pt.1_R", "Pt.1_S"), c("Pt.05_R", "Pt.05_S") ), test = t.test, test.args = list(paired = FALSE), annotations = NULL, map_signif_level = c(`****` = 1e-04, `***` = 0.001, `**` = 0.01, `*` = 0.05, ns = 1), y_position = NULL, xmin = NULL, xmax = NULL, margin_top = 0.05, step_increase = 0.12, tip_length = 0.03, manual = FALSE)+ggtitle("Genome-Wide Polygenic Score (GPS)")
