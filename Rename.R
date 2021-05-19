path <- "C:/Users/fanhang/Desktop/Report/0在用"
filenames <- list.files(path)
newnames <- paste0(str_sub(filenames, end = -11), str_sub(today() - 1, -5), ".xlsx")
file.rename(paste0(path, "/", filenames), paste0(path, "/", newnames))