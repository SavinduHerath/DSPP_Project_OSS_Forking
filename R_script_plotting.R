getwd()

setwd("\\\\nash/mtec-home/spathiran/My Documents/Forking Data")

list.files()

at <- read.csv("activity_table.csv")

at_complete <- na.omit(at)[!(na.omit(at)$X %in% c("locked", "comment_deleted")), ]

row.names(at_complete)

par(mar=c(5, 11, 3, 3))
barplot(height=at_complete$common.devs.activity.on.Bitcoin.after.fork....of.all.activity.after.fork.*100, 
        names=at_complete$X, 
        xlab = "% performed by common developers",
        main = "Activities on BTC - after fork",
        col="#69b3a2", 
        horiz = TRUE, 
        las = 1)
abline(v = min(at_complete$common.devs.activity.on.Bitcoin.after.fork....of.all.activity.after.fork.*100), col = "red")

barplot(height=at_complete$common.devs.activity.on.Bitcoin.ABC....of.all.activity.*100, 
        names=at_complete$X, 
        xlab = "% performed by common developers",
        main = "Activities on BCH - after fork",
        col="#4DB3E6", 
        horiz = TRUE, 
        las = 1)
abline(v = min(at_complete$common.devs.activity.on.Bitcoin.ABC....of.all.activity.*100), col = "red")

sum_bch_cd <- sum(at_complete$common.devs.activity.on.Bitcoin.ABC)
sum_bch_all <- sum(at_complete$all.activity.on.Bitcoin.ABC)
vec_bch <- c(sum_bch_cd, sum_bch_all - sum_bch_cd)
perc_vec_bch <- round(100*vec_bch/sum_bch_all, 1)
pie_labs <- c("common devs", "others")

pie(vec_bch, labels = perc_vec_bch,  main = "Activities on BCH - after fork", col = c("#4DB3E6", "white"))
legend("topright", pie_labs, cex = 0.8, fill = c("#4DB3E6", "white"))


sum_btc_cd <- sum(at_complete$common.devs.activity.on.Bitcoin.after.fork)
sum_btc_all <- sum(at_complete$all.activity.on.Bitcoin)
vec_btc <- c(sum_btc_cd, sum_btc_all - sum_btc_cd)
perc_vec_btc <- round(100*vec_btc/sum_btc_all, 1)

pie(vec_btc, labels = perc_vec_btc,  main = "Activities on BTC - after fork", col = c("#69b3a2", "white"))
legend("topright", pie_labs, cex = 0.8, fill = c("#69b3a2", "white"))
