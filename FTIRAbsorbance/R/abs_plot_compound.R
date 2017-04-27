#' abs_plot_compound Function
#'
#' The plot_abs function displays the absorbance of the plastic material vs wavelength from 600 to 4000 nm
#' including the intensity of peaks for each particular compound and molecule.
#' @param df df = dataset, must be in dataframe
#' @param df_x df_x = column of wavelength values; must be numeric
#' @param df_y df_y = column of desired absorbance; must be numeric
#' @param xname xname allows users to name the x-axis; can be character and/or numeric
#' @param yname yname allows users to name the y-axis; can be character and/or numeric
#' @param title title allows users to name the plot; can be character and/or numeric
#' @return plot
#' @keywords absorbance
#' @export

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

