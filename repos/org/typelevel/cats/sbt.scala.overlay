package sbt

import java.nio.file.Files
import java.nio.charset.StandardCharsets

object `package` {
  type File = java.io.File

  implicit final class FileOps(val file: File) extends AnyVal {
    def /(next: String): File = new File(file, next)
  }
}

object IO {

  def write(file: File, content: String): Unit = {
    file.getParentFile.mkdirs()
    Files.write(file.toPath, content.getBytes(StandardCharsets.UTF_8))
  }
}
