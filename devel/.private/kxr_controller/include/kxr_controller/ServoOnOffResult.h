// Generated by gencpp from file kxr_controller/ServoOnOffResult.msg
// DO NOT EDIT!


#ifndef KXR_CONTROLLER_MESSAGE_SERVOONOFFRESULT_H
#define KXR_CONTROLLER_MESSAGE_SERVOONOFFRESULT_H


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
struct ServoOnOffResult_
{
  typedef ServoOnOffResult_<ContainerAllocator> Type;

  ServoOnOffResult_()
    {
    }
  ServoOnOffResult_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::kxr_controller::ServoOnOffResult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::kxr_controller::ServoOnOffResult_<ContainerAllocator> const> ConstPtr;

}; // struct ServoOnOffResult_

typedef ::kxr_controller::ServoOnOffResult_<std::allocator<void> > ServoOnOffResult;

typedef boost::shared_ptr< ::kxr_controller::ServoOnOffResult > ServoOnOffResultPtr;
typedef boost::shared_ptr< ::kxr_controller::ServoOnOffResult const> ServoOnOffResultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::kxr_controller::ServoOnOffResult_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::kxr_controller::ServoOnOffResult_<ContainerAllocator> >::stream(s, "", v);
return s;
}


} // namespace kxr_controller

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::kxr_controller::ServoOnOffResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::kxr_controller::ServoOnOffResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::kxr_controller::ServoOnOffResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::kxr_controller::ServoOnOffResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::kxr_controller::ServoOnOffResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::kxr_controller::ServoOnOffResult_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::kxr_controller::ServoOnOffResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::kxr_controller::ServoOnOffResult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::kxr_controller::ServoOnOffResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "kxr_controller/ServoOnOffResult";
  }

  static const char* value(const ::kxr_controller::ServoOnOffResult_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::kxr_controller::ServoOnOffResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
;
  }

  static const char* value(const ::kxr_controller::ServoOnOffResult_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::kxr_controller::ServoOnOffResult_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ServoOnOffResult_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::kxr_controller::ServoOnOffResult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::kxr_controller::ServoOnOffResult_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // KXR_CONTROLLER_MESSAGE_SERVOONOFFRESULT_H