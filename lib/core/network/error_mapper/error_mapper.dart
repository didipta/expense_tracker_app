

import '../models/network_resonse.dart';

abstract class ErrorMapper{
NetworkResponse mapError(Exception e);
}