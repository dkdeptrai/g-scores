class StudentScoresController < ApplicationController
  include UtilsFunctionsConcern

  def search

  end

  def search_results
    if params[:sbd].blank?
      return turbo_stream.replace(:notice, partial: 'layouts/notice', locals: { notice: "Please enter SBD to search" })
    end

    @student_score = StudentScore.find_by(sbd: params[:sbd])
    Rails.logger.debug("Student score in controller: #{@student_score}")

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(:search_result, partial: 'student_scores/student_score', locals: { student_score: @student_score })
      end
      format.html do
        if @student_score
          render :search
        else
          flash.now[:alert] = "No student score found with SBD: #{params[:sbd]}"
          render :search
        end
      end
    end
  end

  def report
    @report = REDIS_CLIENT.get('student_scores/report')
    if @report.nil?
      @report = StudentScore.report
      REDIS_CLIENT.set('student_scores/report', @report.to_json, ex: 24.hours)
    else
      @report = convert_to_symbol_keys(JSON.parse(@report))
    end
    render :report
  end

  def group_a_top
    @top_student_scores = REDIS_CLIENT.get('student_scores/group_a_top')
    if @top_student_scores.nil?
      @top_student_scores = StudentScore.group_a_top
      REDIS_CLIENT.set('student_scores/group_a_top', @top_student_scores.to_json, ex: 24.hours)
    else
      res = []
      @top_student_scores = JSON.parse(@top_student_scores)
      @top_student_scores.each do |student_score|
        res << convert_to_symbol_keys(student_score)
      end
      @top_student_scores = res
    end
    Rails.logger.debug("Top student scores: #{@top_student_scores}")

    render :group_a_top
  end
end
