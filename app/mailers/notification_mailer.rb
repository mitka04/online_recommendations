class NotificationMailer < ApplicationMailer
    def new_recommendation_email(patient, recommendation)
        @patient = patient
        @recommendation = recommendation

        mail(
            to: @patient.email,
            subject: 'New recommendation'
        )
    end
end
