import java.io.File

object KittyKernelBoiler {
  def main(args: Array[String]): Unit =
    KernelBoiler.gen(new File(args.headOption getOrElse "."))
}
