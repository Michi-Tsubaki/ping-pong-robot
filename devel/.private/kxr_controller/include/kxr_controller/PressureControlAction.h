// Generated by gencpp from file kxr_controller/PressureControlAction.msg
// DO NOT EDIT!


#ifndef KXR_CONTROLLER_MESSAGE_PRESSURECONTROLACTION_H
#define KXR_CONTROLLER_MESSAGE_PRESSURECONTROLACTION_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <kxr_controller/PressureControlActionGoal.h>
#include <kxr_controller/PressureControlActionResult.h>
#include <kxr_controller/PressureControlActionFeedback.h>

namespace kxr_controller
{
template <class ContainerAllocator>
struct PressureControlAction_
{
  typedef PressureControlAction_<ContainerAllocator> Type;

  PressureControlAction_()
    : action_goal()
    , action_result()
    , action_feedback()  {
    }
  PressureControlAction_(const ContainerAllocator& _alloc)
    : action_goal(_alloc)
    , action_result(_alloc)
    , action_feedback(_alloc)  {
  (void)_alloc;
    }



   typedef  ::kxr_controller::PressureControlActionGoal_<ContainerAllocator>  _action_goal_type;
  _action_goal_type action_goal;

   typedef  ::kxr_controller::PressureControlActionResult_<ContainerAllocator>  _action_result_type;
  _action_result_type action_result;

   typedef  ::kxr_controller::PressureControlActionFeedback_<ContainerAllocator>  _action_feedback_type;
  _action_feedback_type action_feedback;





  typedef boost::shared_ptr< ::kxr_controller::PressureControlAction_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::kxr_controller::PressureControlAction_<ContainerAllocator> const> ConstPtr;

}; // struct PressureControlAction_

typedef ::kxr_controller::PressureControlAction_<std::allocator<void> > PressureControlAction;

typedef boost::shared_ptr< ::kxr_controller::PressureControlAction > PressureControlActionPtr;
typedef boost::shared_ptr< ::kxr_controller::PressureControlAction const> PressureControlActionConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::kxr_controller::PressureControlAction_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::kxr_controller::PressureControlAction_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::kxr_controller::PressureControlAction_<ContainerAllocator1> & lhs, const ::kxr_controller::PressureControlAction_<ContainerAllocator2> & rhs)
{
  return lhs.action_goal == rhs.action_goal &&
    lhs.action_result == rhs.action_result &&
    lhs.action_feedback == rhs.action_feedback;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::kxr_controller::PressureControlAction_<ContainerAllocator1> & lhs, const ::kxr_controller::PressureControlAction_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace kxr_controller

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::kxr_controller::PressureControlAction_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::kxr_controller::PressureControlAction_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::kxr_controller::PressureControlAction_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::kxr_controller::PressureControlAction_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::kxr_controller::PressureControlAction_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::kxr_controller::PressureControlAction_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::kxr_controller::PressureControlAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b48d7a7464bf04936dea34b84b74d2ee";
  }

  static const char* value(const ::kxr_controller::PressureControlAction_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb48d7a7464bf0493ULL;
  static const uint64_t static_value2 = 0x6dea34b84b74d2eeULL;
};

template<class ContainerAllocator>
struct DataType< ::kxr_controller::PressureControlAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "kxr_controller/PressureControlAction";
  }

  static const char* value(const ::kxr_controller::PressureControlAction_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::kxr_controller::PressureControlAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"PressureControlActionGoal action_goal\n"
"PressureControlActionResult action_result\n"
"PressureControlActionFeedback action_feedback\n"
"\n"
"================================================================================\n"
"MSG: kxr_controller/PressureControlActionGoal\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"Header header\n"
"actionlib_msgs/GoalID goal_id\n"
"PressureControlGoal goal\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: actionlib_msgs/GoalID\n"
"# The stamp should store the time at which this goal was requested.\n"
"# It is used by an action server when it tries to preempt all\n"
"# goals that were requested before a certain time\n"
"time stamp\n"
"\n"
"# The id provides a way to associate feedback and\n"
"# result message with specific goal requests. The id\n"
"# specified must be unique.\n"
"string id\n"
"\n"
"\n"
"================================================================================\n"
"MSG: kxr_controller/PressureControlGoal\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"uint16 board_idx  # Do not use board id? (Currently, bus-connected air board is not supported)\n"
"float32 start_pressure  # Threshold [kPa] to start pump (Currently, pressurization is not supported)\n"
"float32 stop_pressure  # Threshold [kPa] to stop pump (Currently, pressurization is not supported)\n"
"bool release  # Set true to release air by opening valve.\n"
"\n"
"================================================================================\n"
"MSG: kxr_controller/PressureControlActionResult\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"Header header\n"
"actionlib_msgs/GoalStatus status\n"
"PressureControlResult result\n"
"\n"
"================================================================================\n"
"MSG: actionlib_msgs/GoalStatus\n"
"GoalID goal_id\n"
"uint8 status\n"
"uint8 PENDING         = 0   # The goal has yet to be processed by the action server\n"
"uint8 ACTIVE          = 1   # The goal is currently being processed by the action server\n"
"uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing\n"
"                            #   and has since completed its execution (Terminal State)\n"
"uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)\n"
"uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due\n"
"                            #    to some failure (Terminal State)\n"
"uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,\n"
"                            #    because the goal was unattainable or invalid (Terminal State)\n"
"uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing\n"
"                            #    and has not yet completed execution\n"
"uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,\n"
"                            #    but the action server has not yet confirmed that the goal is canceled\n"
"uint8 RECALLED        = 8   # The goal received a cancel request before it started executing\n"
"                            #    and was successfully cancelled (Terminal State)\n"
"uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be\n"
"                            #    sent over the wire by an action server\n"
"\n"
"#Allow for the user to associate a string with GoalStatus for debugging\n"
"string text\n"
"\n"
"\n"
"================================================================================\n"
"MSG: kxr_controller/PressureControlResult\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"================================================================================\n"
"MSG: kxr_controller/PressureControlActionFeedback\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"Header header\n"
"actionlib_msgs/GoalStatus status\n"
"PressureControlFeedback feedback\n"
"\n"
"================================================================================\n"
"MSG: kxr_controller/PressureControlFeedback\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
;
  }

  static const char* value(const ::kxr_controller::PressureControlAction_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::kxr_controller::PressureControlAction_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.action_goal);
      stream.next(m.action_result);
      stream.next(m.action_feedback);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PressureControlAction_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::kxr_controller::PressureControlAction_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::kxr_controller::PressureControlAction_<ContainerAllocator>& v)
  {
    s << indent << "action_goal: ";
    s << std::endl;
    Printer< ::kxr_controller::PressureControlActionGoal_<ContainerAllocator> >::stream(s, indent + "  ", v.action_goal);
    s << indent << "action_result: ";
    s << std::endl;
    Printer< ::kxr_controller::PressureControlActionResult_<ContainerAllocator> >::stream(s, indent + "  ", v.action_result);
    s << indent << "action_feedback: ";
    s << std::endl;
    Printer< ::kxr_controller::PressureControlActionFeedback_<ContainerAllocator> >::stream(s, indent + "  ", v.action_feedback);
  }
};

} // namespace message_operations
} // namespace ros

#endif // KXR_CONTROLLER_MESSAGE_PRESSURECONTROLACTION_H