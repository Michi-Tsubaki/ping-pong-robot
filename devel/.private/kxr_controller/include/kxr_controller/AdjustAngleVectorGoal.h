// Generated by gencpp from file kxr_controller/AdjustAngleVectorGoal.msg
// DO NOT EDIT!


#ifndef KXR_CONTROLLER_MESSAGE_ADJUSTANGLEVECTORGOAL_H
#define KXR_CONTROLLER_MESSAGE_ADJUSTANGLEVECTORGOAL_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace kxr_controller
{
template <class ContainerAllocator>
struct AdjustAngleVectorGoal_
{
  typedef AdjustAngleVectorGoal_<ContainerAllocator> Type;

  AdjustAngleVectorGoal_()
    : joint_names()
    , error_threshold()  {
    }
  AdjustAngleVectorGoal_(const ContainerAllocator& _alloc)
    : joint_names(_alloc)
    , error_threshold(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>> _joint_names_type;
  _joint_names_type joint_names;

   typedef std::vector<float, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<float>> _error_threshold_type;
  _error_threshold_type error_threshold;





  typedef boost::shared_ptr< ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator> const> ConstPtr;

}; // struct AdjustAngleVectorGoal_

typedef ::kxr_controller::AdjustAngleVectorGoal_<std::allocator<void> > AdjustAngleVectorGoal;

typedef boost::shared_ptr< ::kxr_controller::AdjustAngleVectorGoal > AdjustAngleVectorGoalPtr;
typedef boost::shared_ptr< ::kxr_controller::AdjustAngleVectorGoal const> AdjustAngleVectorGoalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator1> & lhs, const ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator2> & rhs)
{
  return lhs.joint_names == rhs.joint_names &&
    lhs.error_threshold == rhs.error_threshold;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator1> & lhs, const ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace kxr_controller

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cf618411b2b5e77c4c269ff22a27ed58";
  }

  static const char* value(const ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xcf618411b2b5e77cULL;
  static const uint64_t static_value2 = 0x4c269ff22a27ed58ULL;
};

template<class ContainerAllocator>
struct DataType< ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "kxr_controller/AdjustAngleVectorGoal";
  }

  static const char* value(const ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"string[] joint_names\n"
"float32[] error_threshold\n"
;
  }

  static const char* value(const ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.joint_names);
      stream.next(m.error_threshold);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct AdjustAngleVectorGoal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::kxr_controller::AdjustAngleVectorGoal_<ContainerAllocator>& v)
  {
    s << indent << "joint_names[]" << std::endl;
    for (size_t i = 0; i < v.joint_names.size(); ++i)
    {
      s << indent << "  joint_names[" << i << "]: ";
      Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.joint_names[i]);
    }
    s << indent << "error_threshold[]" << std::endl;
    for (size_t i = 0; i < v.error_threshold.size(); ++i)
    {
      s << indent << "  error_threshold[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.error_threshold[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // KXR_CONTROLLER_MESSAGE_ADJUSTANGLEVECTORGOAL_H
