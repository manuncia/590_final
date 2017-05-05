## ----setup, include=FALSE------------------------------------------------
mulch_plot <- read.csv("TN_BIOAGRI_204_Normalize.csv")

## ----include=FALSE-------------------------------------------------------
library(dplyr)
library(ggplot2)
library(knitr)
library(tibble)
library(dplyr)
library(reshape2)
library(magrittr)

## ------------------------------------------------------------------------
raw_a <- as.data.frame(mulch_plot)
knitr::kable(head(raw_a))

## ---- warning=FALSE------------------------------------------------------
normalize_add_rowmeans <- function(x) {
  for (i in 1:ncol(x)) {
        x[,i] <- (x[,i]- min(x[,i], na.rm = TRUE)) / (max(x[,i],na.rm = TRUE)-min(x[,i], na.rm = TRUE))
      }
      x <- cbind(x,row.means = rowMeans(x)) 
      x <-  add_column(x, Wavelength = 4000:600)
} 
a <- as.data.frame(normalize_add_rowmeans(mulch_plot))
knitr::kable(head(a))

## ------------------------------------------------------------------------
a <- as.data.frame(normalize_add_rowmeans(mulch_plot))

## ---- warning=FALSE------------------------------------------------------
plot_abs <- function(df, df_x, df_y, xname,yname,title) {
    df <- ggplot(df) + geom_line(aes(df_x,df_y, colour = "red")) +
      xlab(deparse(substitute(xname))) + #user can assign a name on the x-axis label
      ylab(deparse(substitute(yname))) + #user can assign a name on the y-axis label
      ggtitle(deparse(substitute(title))) + #user can assign a plot title 
      theme_bw() + theme(legend.position = "none") 
      df
    print(df)} 

## ------------------------------------------------------------------------
plot_abs(a,a$Wavelength,a$C_38SAMPLE,xname = "Wavelength,nm", 
                   yname = "Absorbance, AU", title = "FTIR Spectra of Plastic Mulch") 

## ---- warning=FALSE, results="asis"--------------------------------------
plot_abs_compounds <- function(df, df_x, df_y, xname,yname, title)
{
    df <- ggplot(df) + 
    geom_line(aes(df_x,df_y, colour = "red")) +
    xlab(deparse(substitute(xname))) + #user can assign a name on the x-axis label
    ylab(deparse(substitute(yname))) + #user can assign a name on the y-axis label
    ggtitle(deparse(substitute(title))) + #user can assign a plot title 
    theme_bw() + theme(legend.position = "none") 
    df <- df +
    annotate("text", x= 1800, y=1.1, label="C_O_Stretch", size =3.0) 
    df <- df +   
    annotate("text", x = 800, y = 1.0, label="O_H_Bend", size =3.0)
    df <- df + 
    annotate("text", x= 2994, y=0.3, label="C_H_Stretch", size =3.0)
    df
    print(df)}

## ------------------------------------------------------------------------
plot_abs_compounds(a,a$Wavelength,a$C_38SAMPLE,xname = "Wavelength,nm", 
                   yname = "Absorbance, AU", title = "FTIR Spectra of Plastic Mulch") 

