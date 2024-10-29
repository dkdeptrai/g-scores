class StudentScoresController < ApplicationController

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
    @report = StudentScore.report
    render :report
  end

  def group_a_top
    @top_student_scores = StudentScore.group_a_top
    render :group_a_top
  end
end
