1.  Load in necessary packages

``` r
library(ggplot2)
library(drc)
```

    ## Warning: package 'drc' was built under R version 4.4.3

    ## Loading required package: MASS

    ## 
    ## 'drc' has been loaded.

    ## Please cite R and 'drc' if used for a publication,

    ## for references type 'citation()' and 'citation('drc')'.

    ## 
    ## Attaching package: 'drc'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     gaussian, getInitial

``` r
library(tidyverse)
```

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ## ✔ lubridate 1.9.4     ✔ tibble    3.2.1
    ## ✔ purrr     1.0.2     ✔ tidyr     1.3.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ✖ dplyr::select() masks MASS::select()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

# Functions

``` r
#Learning about functions
#(5*degree_f - 32)/9
#Calculating Celsius:
(5*(32 - 32)/9)
```

    ## [1] 0

``` r
(5*(36 - 32)/9)
```

    ## [1] 2.222222

``` r
(5*(39 - 32)/9)
```

    ## [1] 3.888889

Rather than copy and pasting the same equation and changing the degree_f
value, which can lead to typos, we can create a function instead.

### Sample function

> sample.function \<- function(… variable goes here …){ …. code goes
> here…. return(… output …) }

``` r
# Name a function
F_to_C <- function(f_temp){
 celsius <- (5*(f_temp -32)/9)
 return(celsius)
} 
#in parentheses put the input for that function, it can be anything
#input f_temp into this caluculation, save that resulting value as Celsius, then return that value 

#To use the function:Enter a value you want converted from Fahrenheit to Celsius
F_to_C(32) 
```

    ## [1] 0

``` r
F_to_C(90)
```

    ## [1] 32.22222

# Iterations

- Useful for reproducibility to prevent copy and paste errors

``` r
#Repetition:
rep("A",3) 
```

    ## [1] "A" "A" "A"

``` r
rep(c("A","B"), 10)
```

    ##  [1] "A" "B" "A" "B" "A" "B" "A" "B" "A" "B" "A" "B" "A" "B" "A" "B" "A" "B" "A"
    ## [20] "B"

``` r
rep(c(1,2,5,3), 4, each =5) #repeat sequence of numbers 4 times with each number repeated 5 times 
```

    ##  [1] 1 1 1 1 1 2 2 2 2 2 5 5 5 5 5 3 3 3 3 3 1 1 1 1 1 2 2 2 2 2 5 5 5 5 5 3 3 3
    ## [39] 3 3 1 1 1 1 1 2 2 2 2 2 5 5 5 5 5 3 3 3 3 3 1 1 1 1 1 2 2 2 2 2 5 5 5 5 5 3
    ## [77] 3 3 3 3

``` r
#Sequence: sequence of #s

1:7 #this is a sequence, but use seq() as get more complicated 
```

    ## [1] 1 2 3 4 5 6 7

``` r
seq(from=1, to =7)
```

    ## [1] 1 2 3 4 5 6 7

``` r
seq(from= 0, to = 10, by=2)
```

    ## [1]  0  2  4  6  8 10

``` r
#Seq_along: allows you to generate sequence of numbers based on character vector 

LETTERS #gives alphabet of characters
```

    ##  [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S"
    ## [20] "T" "U" "V" "W" "X" "Y" "Z"

``` r
seq_along(LETTERS) #counts number of characters as sequence 
```

    ##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
    ## [26] 26

# The for loop

**For loop:** sets up iteration of initialization Ask question: Is that
sequence over? Will repeat

<figure>
<img src="PLPA6820\HomeworkAssignments%22forloop.png%22"
alt="For Loop" />
<figcaption aria-hidden="true">For Loop</figcaption>
</figure>

**Example 1**

``` r
for (i in 1:10) {
print(i*2)  
}
```

    ## [1] 2
    ## [1] 4
    ## [1] 6
    ## [1] 8
    ## [1] 10
    ## [1] 12
    ## [1] 14
    ## [1] 16
    ## [1] 18
    ## [1] 20

Note: Inside parentheses for for loop we define our iteration. Usually
use an i as general syntax. Setting i = 1 through 10. Print ix2 so
essentially 1 through 10 x2. You use print so you can see the result in
the console.

**Example 2**

``` r
#Caluclate Fahrenheit for each value -30 through 100
for (i in -30:100){
  result <- F_to_C(i)
  print(result)
}
```

    ## [1] -34.44444
    ## [1] -33.88889
    ## [1] -33.33333
    ## [1] -32.77778
    ## [1] -32.22222
    ## [1] -31.66667
    ## [1] -31.11111
    ## [1] -30.55556
    ## [1] -30
    ## [1] -29.44444
    ## [1] -28.88889
    ## [1] -28.33333
    ## [1] -27.77778
    ## [1] -27.22222
    ## [1] -26.66667
    ## [1] -26.11111
    ## [1] -25.55556
    ## [1] -25
    ## [1] -24.44444
    ## [1] -23.88889
    ## [1] -23.33333
    ## [1] -22.77778
    ## [1] -22.22222
    ## [1] -21.66667
    ## [1] -21.11111
    ## [1] -20.55556
    ## [1] -20
    ## [1] -19.44444
    ## [1] -18.88889
    ## [1] -18.33333
    ## [1] -17.77778
    ## [1] -17.22222
    ## [1] -16.66667
    ## [1] -16.11111
    ## [1] -15.55556
    ## [1] -15
    ## [1] -14.44444
    ## [1] -13.88889
    ## [1] -13.33333
    ## [1] -12.77778
    ## [1] -12.22222
    ## [1] -11.66667
    ## [1] -11.11111
    ## [1] -10.55556
    ## [1] -10
    ## [1] -9.444444
    ## [1] -8.888889
    ## [1] -8.333333
    ## [1] -7.777778
    ## [1] -7.222222
    ## [1] -6.666667
    ## [1] -6.111111
    ## [1] -5.555556
    ## [1] -5
    ## [1] -4.444444
    ## [1] -3.888889
    ## [1] -3.333333
    ## [1] -2.777778
    ## [1] -2.222222
    ## [1] -1.666667
    ## [1] -1.111111
    ## [1] -0.5555556
    ## [1] 0
    ## [1] 0.5555556
    ## [1] 1.111111
    ## [1] 1.666667
    ## [1] 2.222222
    ## [1] 2.777778
    ## [1] 3.333333
    ## [1] 3.888889
    ## [1] 4.444444
    ## [1] 5
    ## [1] 5.555556
    ## [1] 6.111111
    ## [1] 6.666667
    ## [1] 7.222222
    ## [1] 7.777778
    ## [1] 8.333333
    ## [1] 8.888889
    ## [1] 9.444444
    ## [1] 10
    ## [1] 10.55556
    ## [1] 11.11111
    ## [1] 11.66667
    ## [1] 12.22222
    ## [1] 12.77778
    ## [1] 13.33333
    ## [1] 13.88889
    ## [1] 14.44444
    ## [1] 15
    ## [1] 15.55556
    ## [1] 16.11111
    ## [1] 16.66667
    ## [1] 17.22222
    ## [1] 17.77778
    ## [1] 18.33333
    ## [1] 18.88889
    ## [1] 19.44444
    ## [1] 20
    ## [1] 20.55556
    ## [1] 21.11111
    ## [1] 21.66667
    ## [1] 22.22222
    ## [1] 22.77778
    ## [1] 23.33333
    ## [1] 23.88889
    ## [1] 24.44444
    ## [1] 25
    ## [1] 25.55556
    ## [1] 26.11111
    ## [1] 26.66667
    ## [1] 27.22222
    ## [1] 27.77778
    ## [1] 28.33333
    ## [1] 28.88889
    ## [1] 29.44444
    ## [1] 30
    ## [1] 30.55556
    ## [1] 31.11111
    ## [1] 31.66667
    ## [1] 32.22222
    ## [1] 32.77778
    ## [1] 33.33333
    ## [1] 33.88889
    ## [1] 34.44444
    ## [1] 35
    ## [1] 35.55556
    ## [1] 36.11111
    ## [1] 36.66667
    ## [1] 37.22222
    ## [1] 37.77778

``` r
#To store values from for loop

# Initialize an empty data frame to store the results
celsius.df <- NULL

# Loop through the range of temperatures from -30 to 100
for (i in -30:100) {
  # Convert the current temperature from Fahrenheit to Celsius and store it in a data frame
  result <- data.frame(F_to_C(i), i)
  
  # Add the result to the celsius.df data frame
  celsius.df <- rbind.data.frame(celsius.df, result)
  
  # Print the current result
  print(result)
}
```

    ##   F_to_C.i.   i
    ## 1 -34.44444 -30
    ##   F_to_C.i.   i
    ## 1 -33.88889 -29
    ##   F_to_C.i.   i
    ## 1 -33.33333 -28
    ##   F_to_C.i.   i
    ## 1 -32.77778 -27
    ##   F_to_C.i.   i
    ## 1 -32.22222 -26
    ##   F_to_C.i.   i
    ## 1 -31.66667 -25
    ##   F_to_C.i.   i
    ## 1 -31.11111 -24
    ##   F_to_C.i.   i
    ## 1 -30.55556 -23
    ##   F_to_C.i.   i
    ## 1       -30 -22
    ##   F_to_C.i.   i
    ## 1 -29.44444 -21
    ##   F_to_C.i.   i
    ## 1 -28.88889 -20
    ##   F_to_C.i.   i
    ## 1 -28.33333 -19
    ##   F_to_C.i.   i
    ## 1 -27.77778 -18
    ##   F_to_C.i.   i
    ## 1 -27.22222 -17
    ##   F_to_C.i.   i
    ## 1 -26.66667 -16
    ##   F_to_C.i.   i
    ## 1 -26.11111 -15
    ##   F_to_C.i.   i
    ## 1 -25.55556 -14
    ##   F_to_C.i.   i
    ## 1       -25 -13
    ##   F_to_C.i.   i
    ## 1 -24.44444 -12
    ##   F_to_C.i.   i
    ## 1 -23.88889 -11
    ##   F_to_C.i.   i
    ## 1 -23.33333 -10
    ##   F_to_C.i.  i
    ## 1 -22.77778 -9
    ##   F_to_C.i.  i
    ## 1 -22.22222 -8
    ##   F_to_C.i.  i
    ## 1 -21.66667 -7
    ##   F_to_C.i.  i
    ## 1 -21.11111 -6
    ##   F_to_C.i.  i
    ## 1 -20.55556 -5
    ##   F_to_C.i.  i
    ## 1       -20 -4
    ##   F_to_C.i.  i
    ## 1 -19.44444 -3
    ##   F_to_C.i.  i
    ## 1 -18.88889 -2
    ##   F_to_C.i.  i
    ## 1 -18.33333 -1
    ##   F_to_C.i. i
    ## 1 -17.77778 0
    ##   F_to_C.i. i
    ## 1 -17.22222 1
    ##   F_to_C.i. i
    ## 1 -16.66667 2
    ##   F_to_C.i. i
    ## 1 -16.11111 3
    ##   F_to_C.i. i
    ## 1 -15.55556 4
    ##   F_to_C.i. i
    ## 1       -15 5
    ##   F_to_C.i. i
    ## 1 -14.44444 6
    ##   F_to_C.i. i
    ## 1 -13.88889 7
    ##   F_to_C.i. i
    ## 1 -13.33333 8
    ##   F_to_C.i. i
    ## 1 -12.77778 9
    ##   F_to_C.i.  i
    ## 1 -12.22222 10
    ##   F_to_C.i.  i
    ## 1 -11.66667 11
    ##   F_to_C.i.  i
    ## 1 -11.11111 12
    ##   F_to_C.i.  i
    ## 1 -10.55556 13
    ##   F_to_C.i.  i
    ## 1       -10 14
    ##   F_to_C.i.  i
    ## 1 -9.444444 15
    ##   F_to_C.i.  i
    ## 1 -8.888889 16
    ##   F_to_C.i.  i
    ## 1 -8.333333 17
    ##   F_to_C.i.  i
    ## 1 -7.777778 18
    ##   F_to_C.i.  i
    ## 1 -7.222222 19
    ##   F_to_C.i.  i
    ## 1 -6.666667 20
    ##   F_to_C.i.  i
    ## 1 -6.111111 21
    ##   F_to_C.i.  i
    ## 1 -5.555556 22
    ##   F_to_C.i.  i
    ## 1        -5 23
    ##   F_to_C.i.  i
    ## 1 -4.444444 24
    ##   F_to_C.i.  i
    ## 1 -3.888889 25
    ##   F_to_C.i.  i
    ## 1 -3.333333 26
    ##   F_to_C.i.  i
    ## 1 -2.777778 27
    ##   F_to_C.i.  i
    ## 1 -2.222222 28
    ##   F_to_C.i.  i
    ## 1 -1.666667 29
    ##   F_to_C.i.  i
    ## 1 -1.111111 30
    ##    F_to_C.i.  i
    ## 1 -0.5555556 31
    ##   F_to_C.i.  i
    ## 1         0 32
    ##   F_to_C.i.  i
    ## 1 0.5555556 33
    ##   F_to_C.i.  i
    ## 1  1.111111 34
    ##   F_to_C.i.  i
    ## 1  1.666667 35
    ##   F_to_C.i.  i
    ## 1  2.222222 36
    ##   F_to_C.i.  i
    ## 1  2.777778 37
    ##   F_to_C.i.  i
    ## 1  3.333333 38
    ##   F_to_C.i.  i
    ## 1  3.888889 39
    ##   F_to_C.i.  i
    ## 1  4.444444 40
    ##   F_to_C.i.  i
    ## 1         5 41
    ##   F_to_C.i.  i
    ## 1  5.555556 42
    ##   F_to_C.i.  i
    ## 1  6.111111 43
    ##   F_to_C.i.  i
    ## 1  6.666667 44
    ##   F_to_C.i.  i
    ## 1  7.222222 45
    ##   F_to_C.i.  i
    ## 1  7.777778 46
    ##   F_to_C.i.  i
    ## 1  8.333333 47
    ##   F_to_C.i.  i
    ## 1  8.888889 48
    ##   F_to_C.i.  i
    ## 1  9.444444 49
    ##   F_to_C.i.  i
    ## 1        10 50
    ##   F_to_C.i.  i
    ## 1  10.55556 51
    ##   F_to_C.i.  i
    ## 1  11.11111 52
    ##   F_to_C.i.  i
    ## 1  11.66667 53
    ##   F_to_C.i.  i
    ## 1  12.22222 54
    ##   F_to_C.i.  i
    ## 1  12.77778 55
    ##   F_to_C.i.  i
    ## 1  13.33333 56
    ##   F_to_C.i.  i
    ## 1  13.88889 57
    ##   F_to_C.i.  i
    ## 1  14.44444 58
    ##   F_to_C.i.  i
    ## 1        15 59
    ##   F_to_C.i.  i
    ## 1  15.55556 60
    ##   F_to_C.i.  i
    ## 1  16.11111 61
    ##   F_to_C.i.  i
    ## 1  16.66667 62
    ##   F_to_C.i.  i
    ## 1  17.22222 63
    ##   F_to_C.i.  i
    ## 1  17.77778 64
    ##   F_to_C.i.  i
    ## 1  18.33333 65
    ##   F_to_C.i.  i
    ## 1  18.88889 66
    ##   F_to_C.i.  i
    ## 1  19.44444 67
    ##   F_to_C.i.  i
    ## 1        20 68
    ##   F_to_C.i.  i
    ## 1  20.55556 69
    ##   F_to_C.i.  i
    ## 1  21.11111 70
    ##   F_to_C.i.  i
    ## 1  21.66667 71
    ##   F_to_C.i.  i
    ## 1  22.22222 72
    ##   F_to_C.i.  i
    ## 1  22.77778 73
    ##   F_to_C.i.  i
    ## 1  23.33333 74
    ##   F_to_C.i.  i
    ## 1  23.88889 75
    ##   F_to_C.i.  i
    ## 1  24.44444 76
    ##   F_to_C.i.  i
    ## 1        25 77
    ##   F_to_C.i.  i
    ## 1  25.55556 78
    ##   F_to_C.i.  i
    ## 1  26.11111 79
    ##   F_to_C.i.  i
    ## 1  26.66667 80
    ##   F_to_C.i.  i
    ## 1  27.22222 81
    ##   F_to_C.i.  i
    ## 1  27.77778 82
    ##   F_to_C.i.  i
    ## 1  28.33333 83
    ##   F_to_C.i.  i
    ## 1  28.88889 84
    ##   F_to_C.i.  i
    ## 1  29.44444 85
    ##   F_to_C.i.  i
    ## 1        30 86
    ##   F_to_C.i.  i
    ## 1  30.55556 87
    ##   F_to_C.i.  i
    ## 1  31.11111 88
    ##   F_to_C.i.  i
    ## 1  31.66667 89
    ##   F_to_C.i.  i
    ## 1  32.22222 90
    ##   F_to_C.i.  i
    ## 1  32.77778 91
    ##   F_to_C.i.  i
    ## 1  33.33333 92
    ##   F_to_C.i.  i
    ## 1  33.88889 93
    ##   F_to_C.i.  i
    ## 1  34.44444 94
    ##   F_to_C.i.  i
    ## 1        35 95
    ##   F_to_C.i.  i
    ## 1  35.55556 96
    ##   F_to_C.i.  i
    ## 1  36.11111 97
    ##   F_to_C.i.  i
    ## 1  36.66667 98
    ##   F_to_C.i.  i
    ## 1  37.22222 99
    ##   F_to_C.i.   i
    ## 1  37.77778 100
