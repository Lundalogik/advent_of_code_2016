package demo

class Day1a {

  def findDistance(instructions: String) = {
    val path = findPath(instructions.split(", "), 0)
    println(path)
    Math.abs(path._1)+Math.abs(path._2)
  }

  def findPath(instructions: Array[String], direction: Int): Tuple2[Int,Int] = {
    if (instructions.isEmpty) (0,0)
    else {
      val head = instructions.head
      val newDirection = (direction + (if (head(0) == 'R') 1 else -1) + 4) % 4
      val directionCoord = newDirection match {
        case 0 => (0, 1)
        case 1 => (1, 0)
        case 2 => (0, -1)
        case 3 => (-1, 0)
      }
      val walk = (head.substring(1).toInt * directionCoord._1, head.substring(1).toInt* directionCoord._2)

      val newPath = findPath(instructions.tail, newDirection)
      (walk._1 + newPath._1, walk._2 + newPath._2)
    }
  }
}