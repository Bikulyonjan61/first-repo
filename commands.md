# My command cheat sheet

## Level 5 → 6: what did ! do in your find command?
- ! is used to represent not so when you find a file that is not executable you write ! -executable

## Level 6 → 7: what does 2>/dev/null do, and why did you need it?
- It is used to remove permission errors when searching thorugh a server. 2> redirects errors to /dev/null and /dev/null is like a black hole which takes all the errors and permission denies

## Level 7 → 8: which command finds a word inside a big file?
- grep can be used to find words in a big file

## Level 8 → 9: why did you need sort before uniq?
- we need sort to sort out things in a file and uniq helps to find uniq lines or words. uniq compare the lines next to each other so if line 3 and line 10 are same it does not notice it which is why we use sort to sort out.

## Level 9 → 10: what does strings do to a binary file?
- it helps get readable text from a binary file