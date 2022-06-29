const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#090B14", /* black   */
  [1] = "#224D4E", /* red     */
  [2] = "#19526A", /* green   */
  [3] = "#1D9468", /* yellow  */
  [4] = "#196392", /* blue    */
  [5] = "#4E588F", /* magenta */
  [6] = "#42ABA8", /* cyan    */
  [7] = "#bedfd5", /* white   */

  /* 8 bright colors */
  [8]  = "#859c95",  /* black   */
  [9]  = "#224D4E",  /* red     */
  [10] = "#19526A", /* green   */
  [11] = "#1D9468", /* yellow  */
  [12] = "#196392", /* blue    */
  [13] = "#4E588F", /* magenta */
  [14] = "#42ABA8", /* cyan    */
  [15] = "#bedfd5", /* white   */

  /* special colors */
  [256] = "#090B14", /* background */
  [257] = "#bedfd5", /* foreground */
  [258] = "#bedfd5",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
