require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # arrange
   robot_one = Robot.new
   robot_one.needs_repairs = true
   robot_one.foreign_model = true
   # act
   repair_shop = robot_one.station
   # assert
   assert_equal(1, repair_shop)

  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
   robot_one = Robot.new
   robot_one.needs_repairs = true
   robot_one.vintage_model = true
   # act
   repair_shop = robot_one.station
   # assert
   assert_equal(2, repair_shop)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
     robot_one = Robot.new
     robot_one.needs_repairs = true
     # act
     repair_shop = robot_one.station
     # assert
     assert_equal(3, repair_shop)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
   robot_one = Robot.new
   robot_one.needs_repairs = false
   # act
   repair_shop = robot_one.station
   # assert
   assert_equal(4, repair_shop)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
   robot_one = Robot.new
   robot_one.todos = []
   # act
   result = robot_one.prioritize_tasks
   # assert
   assert_equal(-1, result)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
   robot_one = Robot.new
   robot_one.todos = [1,2,3]
   # act
   result = robot_one.prioritize_tasks
   # assert
   assert_equal(3, result)
  end

    def test_workday_on_day_off_returns_false
      # arrange
     robot_one = Robot.new
     robot_one.day_off = 'Tuesday'
     # act
     result = robot_one.workday?('Tuesday')
     # assert
     assert_equal(false, result)
  end

  def test_workday_not_day_off_returns_true
    # arrange
   robot_one = Robot.new
   robot_one.day_off = 'Tuesday'
   # act
   result = robot_one.workday?('Monday')
   # assert
   assert_equal(true, result)
  end


end
