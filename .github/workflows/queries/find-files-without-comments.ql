/**
 * @description Find all files with extension "ts" or "tsx" that do not have any comments
 * @kind problem
 * @id javascript/no-comments-in-file
 * @problem.severity recommendation
 */
import javascript


from File file
where 
  (file.getExtension() = "ts" or file.getExtension() = "tsx") and 
  not exists(Comment comment | comment.getFile() = file)
select file, "Found file without comments: " + file.getAbsolutePath()