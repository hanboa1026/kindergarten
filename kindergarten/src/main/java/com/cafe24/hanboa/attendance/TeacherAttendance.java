package com.cafe24.hanboa.attendance;

public class TeacherAttendance {
	//교직원근태 tb_teacher_attendance
	
	private String attendanceCd;
	private String teacherCd;
	private String teacherDay;
	private String teacherAttendance;
	private String teacherGetOff;
	private String teacherRestLateType;
	private String licenseKindergarten;
	public String getAttendanceCd() {
		return attendanceCd;
	}
	public void setAttendanceCd(String attendanceCd) {
		this.attendanceCd = attendanceCd;
	}
	public String getTeacherCd() {
		return teacherCd;
	}
	public void setTeacherCd(String teacherCd) {
		this.teacherCd = teacherCd;
	}
	public String getTeacherDay() {
		return teacherDay;
	}
	public void setTeacherDay(String teacherDay) {
		this.teacherDay = teacherDay;
	}
	public String getTeacherAttendance() {
		return teacherAttendance;
	}
	public void setTeacherAttendance(String teacherAttendance) {
		this.teacherAttendance = teacherAttendance;
	}
	public String getTeacherGetOff() {
		return teacherGetOff;
	}
	public void setTeacherGetOff(String teacherGetOff) {
		this.teacherGetOff = teacherGetOff;
	}
	public String getTeacherRestLateType() {
		return teacherRestLateType;
	}
	public void setTeacherRestLateType(String teacherRestLateType) {
		this.teacherRestLateType = teacherRestLateType;
	}
	public String getLicenseKindergarten() {
		return licenseKindergarten;
	}
	public void setLicenseKindergarten(String licenseKindergarten) {
		this.licenseKindergarten = licenseKindergarten;
	}
}
