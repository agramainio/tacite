import 'package:flutter/material.dart';

import '../theme/tacite_colors.dart';
import '../theme/tacite_spacing.dart';
import '../theme/tacite_text_styles.dart';
import 'tacite_panel.dart';

class TaciteTimelineCard extends StatelessWidget {
  const TaciteTimelineCard({
    required this.title,
    required this.body,
    required this.meta,
    this.cardKey,
    this.onTap,
    this.onAddToSummary,
    this.onEdit,
    this.onShowOriginalNote,
    this.addToSummaryLabel = 'Add to summary',
    this.editLabel = 'Edit',
    this.moreOptionsLabel = 'More options',
    this.showOriginalNoteLabel = 'Show original note',
    this.swipeAddToSummaryLabel = 'Add to summary',
    this.swipeMoreOptionsLabel = 'More options',
    super.key,
  });

  final String title;
  final String body;
  final String meta;
  final Key? cardKey;
  final VoidCallback? onTap;
  final VoidCallback? onAddToSummary;
  final VoidCallback? onEdit;
  final VoidCallback? onShowOriginalNote;
  final String addToSummaryLabel;
  final String editLabel;
  final String moreOptionsLabel;
  final String showOriginalNoteLabel;
  final String swipeAddToSummaryLabel;
  final String swipeMoreOptionsLabel;

  @override
  Widget build(BuildContext context) {
    final content = TacitePanel(
      child: InkWell(
        borderRadius: BorderRadius.circular(TaciteSpacing.radius),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Text(meta, style: TaciteTextStyles.small)),
                _TimelineCardMenu(
                  moreOptionsLabel: moreOptionsLabel,
                  addToSummaryLabel: addToSummaryLabel,
                  editLabel: editLabel,
                  showOriginalNoteLabel: showOriginalNoteLabel,
                  onAddToSummary: onAddToSummary,
                  onEdit: onEdit,
                  onShowOriginalNote: onShowOriginalNote,
                ),
              ],
            ),
            const SizedBox(height: TaciteSpacing.xs),
            Text(title, style: TaciteTextStyles.sectionTitle),
            const SizedBox(height: TaciteSpacing.xs),
            Text(body, style: TaciteTextStyles.body),
          ],
        ),
      ),
    );

    if (onAddToSummary == null && onEdit == null) {
      return content;
    }

    return Dismissible(
      key: cardKey ?? ValueKey('$meta-$title-$body'),
      direction: DismissDirection.horizontal,
      background: _SwipeBackground(
        alignment: Alignment.centerLeft,
        label: swipeAddToSummaryLabel,
      ),
      secondaryBackground: _SwipeBackground(
        alignment: Alignment.centerRight,
        label: swipeMoreOptionsLabel,
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          onAddToSummary?.call();
        } else if (direction == DismissDirection.endToStart) {
          onEdit?.call();
        }

        return false;
      },
      child: content,
    );
  }
}

class _TimelineCardMenu extends StatelessWidget {
  const _TimelineCardMenu({
    required this.moreOptionsLabel,
    required this.addToSummaryLabel,
    required this.editLabel,
    required this.showOriginalNoteLabel,
    required this.onAddToSummary,
    required this.onEdit,
    required this.onShowOriginalNote,
  });

  final String moreOptionsLabel;
  final String addToSummaryLabel;
  final String editLabel;
  final String showOriginalNoteLabel;
  final VoidCallback? onAddToSummary;
  final VoidCallback? onEdit;
  final VoidCallback? onShowOriginalNote;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_TimelineCardAction>(
      tooltip: moreOptionsLabel,
      icon: const Icon(Icons.more_horiz, size: 20),
      onSelected: (action) {
        switch (action) {
          case _TimelineCardAction.addToSummary:
            onAddToSummary?.call();
          case _TimelineCardAction.edit:
            onEdit?.call();
          case _TimelineCardAction.showOriginalNote:
            onShowOriginalNote?.call();
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: _TimelineCardAction.addToSummary,
          enabled: onAddToSummary != null,
          child: Text(addToSummaryLabel),
        ),
        PopupMenuItem(
          value: _TimelineCardAction.edit,
          enabled: onEdit != null,
          child: Text(editLabel),
        ),
        PopupMenuItem(
          value: _TimelineCardAction.showOriginalNote,
          enabled: onShowOriginalNote != null,
          child: Text(showOriginalNoteLabel),
        ),
      ],
    );
  }
}

class _SwipeBackground extends StatelessWidget {
  const _SwipeBackground({required this.alignment, required this.label});

  final Alignment alignment;
  final String label;

  @override
  Widget build(BuildContext context) {
    final isLeft = alignment == Alignment.centerLeft;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: isLeft ? TaciteColors.accentSoft : TaciteColors.paperMuted,
        borderRadius: BorderRadius.circular(TaciteSpacing.radius),
        border: Border.all(color: TaciteColors.line),
      ),
      child: Align(
        alignment: alignment,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TaciteSpacing.lg),
          child: Text(
            label,
            style: TaciteTextStyles.label.copyWith(
              color: isLeft ? TaciteColors.accentInk : TaciteColors.inkMuted,
            ),
          ),
        ),
      ),
    );
  }
}

enum _TimelineCardAction { addToSummary, edit, showOriginalNote }
